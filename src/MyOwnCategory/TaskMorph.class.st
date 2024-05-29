Class {
	#name : #TaskMorph,
	#superclass : #Morph,
	#category : #'MyOwnCategory-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 14:56'
}
TaskMorph class >> newWithTask: aTask [
	
	^ self new initializeWithTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 15:07'
}
TaskMorph >> initializeWithTask: aTask [
 	
	| task |
	self initialize.

	task := DragAndDropMorph newWithTask: aTask.
	self addMorph: task.
	

]
