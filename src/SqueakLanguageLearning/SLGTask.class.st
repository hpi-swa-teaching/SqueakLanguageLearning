Class {
	#name : #SLGTask,
	#superclass : #Object,
	#instVars : [
		'question'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/29/2024 16:08'
}
SLGTask >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question [
	^ question
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question: anObject [
	question := anObject
]
