Class {
	#name : #Lesson,
	#superclass : #Object,
	#instVars : [
		'description',
		'task'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:43'
}
Lesson class >> newWithDescription: aDescription andTask:aTask [

	^ self basicNew initializeWithDescription: aDescription andTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:44'
}
Lesson class >> newWithTask:aTask [

	^ self basicNew initializeWithTask: aTask
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:44'
}
Lesson >> initializeWithTask: aTask [

	task := aTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:14'
}
Lesson >> task [
	^ task
]
