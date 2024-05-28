Class {
	#name : #LessonPage,
	#superclass : #Page,
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/28/2024 19:56'
}
LessonPage class >> newWithTask: aTask [

	^super new initializeWithTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 21:53'
}
LessonPage >> initializeWithLesson: aLesson [
 
	super initialize.
	self addBackButton;
		addTitle: 'LessonTitle'
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/28/2024 19:55'
}
LessonPage >> initializeWithTask: aTask [
 
	super initialize.
	self addBackButton;
		addTitle: 'LessonTitle'
	

]
