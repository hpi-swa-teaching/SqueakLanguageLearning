"
This class can be used to create a Sub Topic page(the page with all the lesson buttons shown after clicking sub topic button on Topic page)
"
Class {
	#name : #SLGSubtopicPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'topic',
		'subtopic',
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Pages',
	#'squeak_changestamp' : 'yegi 7/9/2024 10:40'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'yegi 7/10/2024 14:44'
}
SLGSubtopicPageView class >> newWithTopic: aTopic andSubtopic: aSubtopic andController: aController [

	^ self new 
		controller: aController;
		topic: aTopic;
		subtopic: aSubtopic;
		constructView;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:53'
}
SLGSubtopicPageView >> constructView [

	| rows cols |
	self addTitle: self subtopic title.
	rows :=  OrderedCollection new.
	rows addAll: self getLessonButtons.	
	cols := SLGLayout columnWithMorphs: rows withGap: (self class gapHeight) px.
	cols center: self center.
	self body addMorph: cols
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:55'
}
SLGSubtopicPageView >> createButtonWithLessonPage: aPage withIndex: anIndex withRouteKey: aRouteKey [ 
	
	^ SLGNavigationButtonGen new 
		label: 'Lesson ' , anIndex;
		width: (self class buttonWidth) px;	
		onClickWithBlock: [aPage currentIndex: anIndex.
			self controller routerController navigateTo: aRouteKey];
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:34'
}
SLGSubtopicPageView >> getLessonButtonWithLessonPage: aPage withLesson: aLesson withIndex: anInt withRouteKey: aString [
	
	| routeKey index button | 
	routeKey := aString.
	index := anInt.
	self controller routerController 
		addRouteWithPath: routeKey 
		withPage: aPage.
	button := self createButtonWithLessonPage: aPage withIndex: index withRouteKey: routeKey.
	self lessonCompletedCheck: aLesson withColor: button.

	^ button
		
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:21'
}
SLGSubtopicPageView >> getLessonButtons [

	| index page |
	index := 0.
	page := self pageSetup.
	^ self subtopic lessons
		collect: [:lesson | 
			| button currentRouteKey |
			currentRouteKey := '/home/' , self topic title , '/' , self subtopic title , '/' , 'lessons'.
			button := self getLessonButtonWithLessonPage: page
						withLesson: lesson
						withIndex: index
						withRouteKey: currentRouteKey.
			index := index + 1.
			button]	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:33'
}
SLGSubtopicPageView >> lessonCompletedCheck: aLesson withColor: aButton [

	((SLGUserProgress userData) completed includes: ((aLesson task) id)) 
		ifTrue: [aButton color: self class pastelGreen].
	aLesson task when: #taskCompleted evaluate: [aButton color: self class pastelGreen]
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
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:20'
}
SLGSubtopicPageView >> pageSetup [

	^ SLGLessonPageView
		newWithLessons: self subtopic lessons
		withSubtopic: self subtopic
		withTopic: self topic
		withController: self controller
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
