"
This class is the mutual interface for single and multiple choice task.
"
Class {
	#name : #SLGBaseChoiceTask,
	#superclass : #SLGTask,
	#instVars : [
		'answerOptions'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 18:44'
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
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:47'
}
SLGBaseChoiceTask >> isValid: anOrderedCollection [
	
	^ (anOrderedCollection allSatisfy: [:each | each = false]) not
	

]
