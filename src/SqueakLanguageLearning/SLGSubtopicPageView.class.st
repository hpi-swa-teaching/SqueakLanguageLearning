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
	#'squeak_changestamp' : 'yegi 7/10/2024 14:48'
}
SLGSubtopicPageView >> constructView [

	| rows cols |
	self addTitle: self subtopic title.
	rows :=  OrderedCollection new.
	rows addAll: self getLessonButtons.	
	cols := SLGLayout columnWithMorphs: rows withGap: self class gapHeight.
	cols center: self center.
	
	self body addMorph: cols
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:13'
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
		];
		yourself.
		
		((SLGUserProgress userData) completed includes: ((aLesson task) id) ) 
			ifTrue: [button color: self class pastelGreen.].
		
		aLesson task when: #taskCompleted evaluate: [button color: self class pastelGreen.].
	
		^ button
		
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 14:48'
}
SLGSubtopicPageView >> getLessonButtons [
	
	| index page |
	index := 0.
	"page:= SLGLessonPageView new
				initializeWithLessons: self subtopic lessons
				Subtopic: self subtopic
				Topic: self topic
				andController: self controller."
	page := SLGLessonPageView newWithLessons: self subtopic lessons 
									withSubtopic: self subtopic 
									withTopic: self topic 
									withController: self controller.
	^ self subtopic lessons collect: [:lesson |
		| button currentRouteKey |
		
		currentRouteKey :=  ('/home/', self topic title, '/', self subtopic title, '/', 'lessons').
		button  := self getLessonButtonWithLessonPage: page
						withLesson: lesson
						withIndex: index
						withRouteKey: currentRouteKey.
		index := index + 1.
		button]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 7/10/2024 14:43'
}
SLGSubtopicPageView >> initialize [
	
	super initialize.

	"self addTitle: self subtopic title."
	"self constructView"
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
