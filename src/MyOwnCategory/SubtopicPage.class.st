Class {
	#name : #SubtopicPage,
	#superclass : #NavigationPage,
	#instVars : [
		'lessonPages'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 21:44'
}
SubtopicPage class >> newWithSubtopic: aSubtopic [
	
	^super new initializeWithSubtopic: aSubtopic
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:10'
}
SubtopicPage >> initializeWithSubtopic: aSubtopic [

	| lessonPagesDictionary |
	
	self addTitle: aSubtopic title.
	lessonPagesDictionary := Dictionary new.
	
	aSubtopic lessons do: [:lesson |
            | lessonPage |
            lessonPage := LessonPage newWithLesson: lesson.
		"TODO change a description to smth else and consider task-lesson"
            lessonPagesDictionary at: lesson description put: lessonPage.
		World addMorph: lessonPage.
		lessonPage hide.
        ].
	
	super initializeWithPagesDictionary: lessonPagesDictionary.	
]
