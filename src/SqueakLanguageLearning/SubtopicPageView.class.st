Class {
	#name : #SubtopicPageView,
	#superclass : #AbstractNavigationPage,
	#instVars : [
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 10:41'
}
SubtopicPageView class >> newWithSubtopic: aSubtopic andController: aController [
	
	^super basicNew initializeWithSubtopic: aSubtopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:35'
}
SubtopicPageView >> initializeWithTopic: aTopic andSubtopic: aSubtopic andController: aController [
	
	| rows cols lessonsTitles index |
	
	super initializeWithController: aController.
	Transcript show: self controller.
	self addTitle: aSubtopic title.
	
	lessons := aSubtopic lessons.
	lessonsTitles := Array new: (lessons size).
	index := 0.
	
	rows := lessons collect: [:lesson |
		| btn routePath |
		
		 routePath := ('/home/', aTopic title, '/', aSubtopic title, '/', index).
		
		self controller routerController addRouteWithPath: routePath withPage: (LessonPageView new initializeWithLesson: lesson andController: controller).
		
		btn := SLGButtonGen new
			label: ('/', index);
			width: 400;
			 onClickWithBlock: [
				self controller routerController navigateTo: routePath.
			].
		index := index +1.
		SLGLayout columnWithMorphs: {
			btn.
			SLGSpacerGen newSpacerWithDim: (0@20)
		}
	].
	
	cols := SLGLayout columnWithMorphs: rows.
	
	cols center: self center.
	
	self addMorph: cols.

]
