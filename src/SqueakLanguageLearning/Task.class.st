Class {
	#name : #Task,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'task',
		'isCompleted'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 15:15'
}
Task class >> newWithDescription: aDescription [

	^self new description: aDescription
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 15:13'
}
Task >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 15:14'
}
Task >> description: aDescription [

	description := aDescription
]
