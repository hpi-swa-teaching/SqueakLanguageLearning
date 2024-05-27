Class {
	#name : #LessonPage,
	#superclass : #Page,
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 21:54'
}
LessonPage class >> newWithLesson: aLesson [

	^super new initializeWithLesson: aLesson
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
