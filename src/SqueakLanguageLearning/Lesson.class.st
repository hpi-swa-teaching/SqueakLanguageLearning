Class {
	#name : #Lesson,
	#superclass : #Object,
	#instVars : [
		'description',
		'task'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:27'
}
Lesson class >> description: aDescription task:aTask [

	^ self new initializeWithDescription: aDescription andTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:40'
}
Lesson class >> newWithDescription: aDescription andTask:aTask [

	^ self new initializeWithDescription: aDescription andTask: aTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:14'
}
Lesson >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:13'
}
Lesson >> initializeWithDescription: aDescription andTask: aTask [

	description := aDescription.
	task := aTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:14'
}
Lesson >> task [
	^ task
]
