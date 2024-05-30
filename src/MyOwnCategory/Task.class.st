Class {
	#name : #Task,
	#superclass : #Object,
	#instVars : [
		'id',
		'taskType',
		'description',
		'task',
		'isCompleted'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:49'
}
Task class >> newWithDescription: aDescription [

	^ self new initializeWithDescription: aDescription
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:23'
}
Task >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:24'
}
Task >> initializeWithDescription: aDescription [

	description := aDescription
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/30/2024 13:53'
}
Task >> taskType [
	^ taskType
]
