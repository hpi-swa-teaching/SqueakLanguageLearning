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
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/26/2024 14:30'
}
SLGLesson class >> newWithTask: aTask [

	^ self new
		task: aTask;
		yourself
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/9/2024 14:13'
}
SLGLesson >> isCompleted [

	^self task isCompleted


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/12/2024 16:26'
}
SLGLesson >> task [
	^ task
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/26/2024 15:46'
}
SLGLesson >> task: aTask [
	task := aTask
]
