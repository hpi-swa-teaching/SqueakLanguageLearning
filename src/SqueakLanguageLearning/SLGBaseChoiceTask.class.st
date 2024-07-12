"
This class has general properties on logic for both single and multiple choice.
"
Class {
	#name : #SLGBaseChoiceTask,
	#superclass : #SLGTask,
	#instVars : [
		'answerOptions'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:29'
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
	#'squeak_changestamp' : 'SW 7/11/2024 13:45'
}
SLGBaseChoiceTask >> isValid: anOrderedCollection [
	
	^ (anOrderedCollection allSatisfy: [:each | each = false]) not
	

]
