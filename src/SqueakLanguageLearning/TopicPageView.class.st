Class {
	#name : #TopicPageView,
	#superclass : #AbstractNavigationPage,
	#instVars : [
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:14'
}
TopicPageView class >> newWithTopic: aTopic andController: aController [

	^super basicNew initializeWithTopic: aTopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:43'
}
TopicPageView >> initializeWithTopic: aTopic andController: aController [
	
	| rows cols subtopicTitles |
	super initializeWithController: aController.
	self addTitle: aTopic title.
	"self addDescriptionTo: aTopic."
	
	subtopics := aTopic subtopics.
	subtopicTitles := Array new: (subtopics size).
	
	rows := subtopics collect: [:subtopic |
		| btn |
		self controller routerController addRouteWithPath: ('/home/', aTopic title, '/', subtopic title) withPage: (SubtopicPageView new initializeWithTopic: aTopic andSubtopic: subtopic andController: self controller).
		
		btn := SLGNavigationButtonGen new
			label: subtopic title;
			width: 400;
			 onClickWithBlock: [
				self controller routerController navigateTo: ('/home/', aTopic title, '/', subtopic title).
			].
		
		SLGLayout columnWithMorphs: {
			btn.
			SLGSpacerGen newSpacerWithDim: (0@20)
		}
	].
	
	cols := SLGLayout columnWithMorphs: rows.
	
	cols center: self center.
	
	self addMorph: cols.
	
	
	
]
