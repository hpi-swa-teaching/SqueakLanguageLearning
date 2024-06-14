Class {
	#name : #SubtopicPageView,
	#superclass : #AbstractPage,
	#instVars : [
		'topic',
		'subtopic',
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
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:42'
}
SubtopicPageView >> constructView [
	| rows cols |
	
	rows :=  OrderedCollection new.
	
	rows addAll: self getLessonButtons.
	
	cols := SLGLayout columnWithMorphs: rows withGap: 20.
	
	cols center: self center.
	
	self body addMorph: cols.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/13/2024 21:25'
}
SubtopicPageView >> getLessonButtonWithLesson: aLesson withIndex: anInt withRouteKey: aString [
	| routeKey index button | 
	
	routeKey := aString.
	index := anInt.
	
	self controller routerController 
		addRouteWithPath: routeKey 
		withPage: (LessonPageView new initializeWithLesson: aLesson andController: controller).
		
		button := SLGNavigationButtonGen new
			label: ('Lesson ', index);
			width: self class buttonWidth;
			 onClickWithBlock: [
				self controller routerController navigateTo: routeKey.
			].
		
		((SLGUserProgress userData) completed includes: ((aLesson task) id) ) 
			ifTrue: [button color: Color green.].
		
		aLesson task when: #taskCompleted evaluate: [button color: Color green.].
	
		^button
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/13/2024 21:25'
}
SubtopicPageView >> getLessonButtons [
	|index|
	
	index := 0.
	
	^self subtopic lessons collect: [:lesson |
		| button |
		button := self getLessonButtonWithLesson: lesson
						withIndex: index
						withRouteKey: ('/home/', self topic title, '/', self subtopic title, '/', index).
			
		index := index + 1.
		
		button
	]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:30'
}
SubtopicPageView >> initializeWithTopic: aTopic andSubtopic: aSubtopic andController: aController [
	
	super initializeWithController: aController.
	self topic: aTopic.
	self subtopic: aSubtopic.
	self addTitle: aSubtopic title.
	
	self constructView.
	
	aSubtopic when: #subtopicCompleted evaluate: [self updateSubtopicScoreDisplay].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> lessons [
	^ lessons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> lessons: anObject [
	lessons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> subtopic [
	^ subtopic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> subtopic: anObject [
	subtopic := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> topic [
	^ topic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SubtopicPageView >> topic: anObject [
	topic := anObject
]
