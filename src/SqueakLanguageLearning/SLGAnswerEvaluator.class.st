"
This class is a Mock Object for SLGTask supporting all methods to validate and verify user input.
"
Class {
	#name : #SLGAnswerEvaluator,
	#superclass : #Object,
	#instVars : [
		'correctAnswer'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/5/2024 17:23'
}

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluator >> calculatePercentage: aValue with: aTotal [

        | percentage |
        percentage := ((aValue / aTotal) * 100) rounded.

        ^ percentage
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluator >> calculateResult: anUserInput [

        | comparison percentage |
        comparison := self findMatches: self correctAnswer with: anUserInput.
        percentage := self calculatePercentage: (comparison size) with: (self correctAnswer size).
        
        ^ percentage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/6/2024 14:23'
}
SLGAnswerEvaluator >> correctAnswer [
        ^ correctAnswer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 11:30'
}
SLGAnswerEvaluator >> correctAnswer: anAnswer [ 
        correctAnswer := anAnswer.
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluator >> findMatches: correctAnswer with: userAnswer [
        "Mock implementation: Find matching characters between two strings."

        | matches |
        matches := ''.
        1 to: (correctAnswer size min: userAnswer size) do: [:index |
            (correctAnswer at: index) = (userAnswer at: index) 
			ifTrue: [matches := matches , (correctAnswer at: index) asString]].
		
        ^ matches
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:34'
}
SLGAnswerEvaluator >> isValid: anUserInput [ 
        "Mock implementation: Returns true for non-empty strings."

        ^ anUserInput isEmpty not

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:34'
}
SLGAnswerEvaluator >> sendError [ 
        "Mock implementation: Returns 'Invalid Input' for invalid input."

        ^ 'Invalid Input'
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluator >> verifyAnswer: anUserInput [

        | output |
        (self isValid: anUserInput)
            ifTrue: [ output := self calculateResult: anUserInput ]
            ifFalse: [ output := self sendError ].
        
        ^ output
]
