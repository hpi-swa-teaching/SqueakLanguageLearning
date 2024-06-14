Class {
	#name : #AnswerEvaluator,
	#superclass : #Object,
	#instVars : [
		'correctAnswer'
	],
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:23'
}
AnswerEvaluator >> calculatePercentage: aValue with: aTotal [
        | percentage |
        percentage := ((aValue / aTotal) * 100) rounded.
        ^ percentage
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:23'
}
AnswerEvaluator >> calculateResult: anUserInput [
        | comparison percentage |
        
        Transcript show: 'No Error occurred.'; cr.
        
        comparison := self findMatches: self correctAnswer with: anUserInput.
        percentage := self calculatePercentage: (comparison size) with: (self correctAnswer size).
        
        ^ percentage
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:31'
}
AnswerEvaluator >> correctAnswer [
        ^ correctAnswer.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:30'
}
AnswerEvaluator >> correctAnswer: anAnswer [ 
        correctAnswer := anAnswer.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:23'
}
AnswerEvaluator >> findMatches: correctAnswer with: userAnswer [
        "Mock implementation: find matching characters between two strings"
        | matches |
        matches := ''.
        1 to: (correctAnswer size min: userAnswer size) do: [:i |
            (correctAnswer at: i) = (userAnswer at: i) ifTrue: [
                matches := matches , (correctAnswer at: i) asString.
            ].
        ].
        ^ matches
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:17'
}
AnswerEvaluator >> isValid: anUserInput [ 
        "Mock implementation: returns true for non-empty strings"
        ^ anUserInput isEmpty not
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:17'
}
AnswerEvaluator >> sendError [ 
        "Mock implementation: returns 'Invalid Input' for invalid input"
        ^ 'Invalid Input'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:18'
}
AnswerEvaluator >> verifyAnswer: anUserInput [ 
        | output |
        
        Transcript show: 'isValid: ', (self isValid: anUserInput) printString; cr.
        
        (self isValid: anUserInput)
            ifTrue: [ output := self calculateResult: anUserInput ]
            ifFalse: [ output := self sendError ].
        
        ^ output
]
