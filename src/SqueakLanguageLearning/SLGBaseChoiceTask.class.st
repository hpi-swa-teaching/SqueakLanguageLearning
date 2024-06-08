Class {
	#name : #SLGBaseChoiceTask,
	#superclass : #SLGTask,
	#instVars : [
		'answerOptions'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:01'
}
SLGBaseChoiceTask >> answerOptions [
	^ answerOptions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGBaseChoiceTask >> answerOptions: anArray [
	answerOptions := anArray
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 17:47'
}
SLGBaseChoiceTask >> isValid: anOrderedCollection [
	
	^ (anOrderedCollection allSatisfy: [:each | each = false]) not
	

]
