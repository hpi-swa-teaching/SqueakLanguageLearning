Class {
	#name : #MultipleChoiceTask,
	#superclass : #Task,
	#instVars : [
		'taskDescription',
		'answerOptions',
		'correctAnswers'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 23:16'
}
MultipleChoiceTask class >> task: aString answerOptions: array correctAnswers: aCollection [

	^ self new initializeWithTask: aString answerOptions: array andAnswers: aCollection
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:12'
}
MultipleChoiceTask >> answerOptions [
	^ answerOptions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:12'
}
MultipleChoiceTask >> answerOptions: anObject [
	answerOptions := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:12'
}
MultipleChoiceTask >> answers [
	^ answers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:12'
}
MultipleChoiceTask >> answers: anObject [
	answers := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 23:15'
}
MultipleChoiceTask >> initializeWithTask: aString answerOptions: aCollection andAnswers: answers [

	taskDescription := aString.
	answerOptions := aCollection.
	correctAnswers:= answers.
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 23:11'
}
MultipleChoiceTask >> isAnswerCorrect:anAnswer [ 

	^ anAnswer = answers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:11'
}
MultipleChoiceTask >> taskDescription [
	^ taskDescription
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/29/2024 23:11'
}
MultipleChoiceTask >> taskDescription: anObject [
	taskDescription := anObject
]
