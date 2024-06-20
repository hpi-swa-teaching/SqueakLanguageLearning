Class {
	#name : #SLGSubtopicPageView,
	#superclass : #SLGAbstractPage,
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
SLGSubtopicPageView class >> newWithSubtopic: aSubtopic andController: aController [
	
	^super basicNew initializeWithSubtopic: aSubtopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:42'
}
SLGSubtopicPageView >> constructView [
	| rows cols |
	
	rows :=  OrderedCollection new.
	
	rows addAll: self getLessonButtons.
	
	cols := SLGLayout columnWithMorphs: rows withGap: 20.
	
	cols center: self center.
	
	self body addMorph: cols.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 00:56'
}
SLGSubtopicPageView >> getLessonButtonWithLesson: aLesson withIndex: anInt withRouteKey: aString [
	| routeKey index button | 
	
	routeKey := aString.
	index := anInt.
	
	self controller routerController 
		addRouteWithPath: routeKey 
		withPage: (SLGLessonPageView new initializeWithLesson: aLesson Subtopic: self subtopic Topic: self topic andController: controller).
		
		button := SLGNavigationButtonGen new
			label: ('Lesson ', index);
			width: self class buttonWidth;
			 onClickWithBlock: [
				self controller routerController navigateTo: routeKey.
			].
		
		((SLGUserProgress userData) completed includes: ((aLesson task) id) ) 
			ifTrue: [button color: self class pastelGreen.].
		
		aLesson task when: #taskCompleted evaluate: [button color: self class pastelGreen.].
	
		^button
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:45'
}
SLGSubtopicPageView >> getLessonButtonWithLessonPage: aPage withIndex: anInt withRouteKey: aString [
	| routeKey index button | 
	
	routeKey := aString.
	index := anInt.
	
	self controller routerController 
		addRouteWithPath: routeKey 
		withPage: aPage.
		
		button := SLGNavigationButtonGen new
			label: ('Lesson ', index);
			width: self class buttonWidth;
			 onClickWithBlock: [
				aPage currentIndex: index.
				self controller routerController navigateTo: routeKey.
			].
		
		"((SLGUserProgress userData) completed includes: ((aLesson task) id) ) 
			ifTrue: [button color: self class pastelGreen.]."
		
		"aLesson task when: #taskCompleted evaluate: [button color: self class pastelGreen.]."
	
		^button
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:47'
}
SLGSubtopicPageView >> getLessonButtonWithLessonPage: aPage withLesson: aLesson withIndex: anInt withRouteKey: aString [
	| routeKey index button | 
	
	routeKey := aString.
	index := anInt.
	
	self controller routerController 
		addRouteWithPath: routeKey 
		withPage: aPage.
		
		button := SLGNavigationButtonGen new
			label: ('Lesson ', index);
			width: self class buttonWidth;
			 onClickWithBlock: [
				aPage currentIndex: index.
				self controller routerController navigateTo: routeKey.
			].
		
		((SLGUserProgress userData) completed includes: ((aLesson task) id) ) 
			ifTrue: [button color: self class pastelGreen.].
		
		aLesson task when: #taskCompleted evaluate: [button color: self class pastelGreen.].
	
		^button
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:08'
}
SLGSubtopicPageView >> getLessonButtons [
	| index page |
	
	index := 0.
	
	page := SLGLessonPageView new
				initializeWithLessons: self subtopic lessons
				Subtopic: self subtopic
				Topic: self topic
				andController: controller.
	
	
	^self subtopic lessons collect: [:lesson |
		| button currentRouteKey |
		
		currentRouteKey :=  ('/home/', self topic title, '/', self subtopic title, '/', 'lessons').
		
		button  := self getLessonButtonWithLessonPage: page
						withLesson: lesson
						withIndex: index
						withRouteKey: currentRouteKey.
			
		index := index + 1.
		
		button
	]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:30'
}
SLGSubtopicPageView >> initializeWithTopic: aTopic andSubtopic: aSubtopic andController: aController [
	
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
SLGSubtopicPageView >> lessons [
	^ lessons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SLGSubtopicPageView >> lessons: anObject [
	lessons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SLGSubtopicPageView >> subtopic [
	^ subtopic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SLGSubtopicPageView >> subtopic: anObject [
	subtopic := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SLGSubtopicPageView >> topic [
	^ topic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:38'
}
SLGSubtopicPageView >> topic: anObject [
	topic := anObject
]
