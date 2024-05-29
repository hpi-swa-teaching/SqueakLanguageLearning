Class {
	#name : #LessonPage,
	#superclass : #Page,
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 14:48'
}
LessonPage class >> newWithTask: aTask [

	^self new initializeWithTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 14:54'
}
LessonPage >> initializeWithLesson: aLesson [
 	
	|task|
	super initialize.
	self addBackButton;
		addTitle: 'LessonTitle'.
		
	"task := SubtopicPage newWithSubtopic: subtopic."
	
	"task := DragAndDropMorph newWithTask: aTask.
	World addMorph: task.
	task hide."
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 15:02'
}
LessonPage >> initializeWithTask: aTask [
 	
	| task |
	super initialize.
	self addBackButton;
		addTitle: 'LessonTitle'.
	
	task := TaskMorph newWithTask: aTask task.
	self addMorph: task.
	

]
