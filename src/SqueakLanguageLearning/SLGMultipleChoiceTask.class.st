Class {
	#name : #SLGMultipleChoiceTask,
	#superclass : #SLGTask,
	#instVars : [
		'answerOptions',
		'answers',
		'question'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 5/31/2024 10:28'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
			answerOptions: anOptionArray;
			answers: anAnswerArray;
			yourself
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:01'
}
SLGMultipleChoiceTask >> answerOptions [
	^ answerOptions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGMultipleChoiceTask >> answerOptions: anArray [
	answerOptions := anArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:02'
}
SLGMultipleChoiceTask >> answers [
	^ answers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGMultipleChoiceTask >> answers: anArray [
	answers := anArray
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/31/2024 11:39'
}
SLGMultipleChoiceTask >> calculatePercentage: aValue with: aTotal [

	| percentage |
	percentage := ((aValue / aTotal) * 100) rounded.
	
	^ percentage

	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 13:26'
}
SLGMultipleChoiceTask >> findMatches: aReferenceArray with: anInputArray [

	^ (1 to: aReferenceArray size) select: [:index | (aReferenceArray at: index) = (anInputArray at: index)] thenCollect: [:index | aReferenceArray at: index].
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/29/2024 16:08'
}
SLGMultipleChoiceTask >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/30/2024 14:28'
}
SLGMultipleChoiceTask >> question [
	^ question
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/30/2024 14:28'
}
SLGMultipleChoiceTask >> question: anObject [
	question := anObject
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 13:26'
}
SLGMultipleChoiceTask >> validate: anUserInput [

	| comparison percentage |
	comparison := self findMatches: self answers with: anUserInput.
	percentage := self calculatePercentage: (comparison size) with: (answers size).
	
	^ percentage
]
