Class {
	#name : #SLGLesson,
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
SLGLesson class >> newWithDescription: aDescription andTask:aTask [

	^ self basicNew initializeWithDescription: aDescription andTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:44'
}
SLGLesson class >> newWithTask:aTask [

	^ self basicNew initializeWithTask: aTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:14'
}
SLGLesson >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:13'
}
SLGLesson >> initializeWithDescription: aDescription andTask: aTask [

	description := aDescription.
	task := aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 23:07'
}
SLGLesson >> initializeWithTask: aTask [

	task := aTask.
	
	"task when: #taskCompleted send: #onTaskCompleted to: self "
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 16:27'
}
SLGLesson >> isCompleted [

	^task isCompleted


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/12/2024 16:26'
}
SLGLesson >> task [
	^ task
]
