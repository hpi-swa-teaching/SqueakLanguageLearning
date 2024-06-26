"
Represents a structure that consists of a task; able to check if its task is completed.
"
Class {
	#name : #SLGLesson,
	#superclass : #Object,
	#instVars : [
		'task'
	],
	#category : #'SqueakLanguageLearning-Data',
	#'squeak_changestamp' : 'EB 6/26/2024 15:39'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:30'
}
SLGLesson class >> newWithTask: aTask [

	^ self new
		task: aTask;
		yourself
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:29'
}
SLGLesson >> task: anObject [
	task := anObject
]
