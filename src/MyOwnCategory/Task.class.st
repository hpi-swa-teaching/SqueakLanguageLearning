Class {
	#name : #Task,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'task',
		'isCompleted'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:26'
}
Task class >> description: aDescription [

	^ self new initializeWithDescription: aDescription
]

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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/28/2024 19:53'
}
Task >> initializeWithDescription: aDescription andTask: aTask [

	description := aDescription.
	task := aTask
]
