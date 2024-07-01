Class {
	#name : #SLGAnswerEvaluatorTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 14:25'
}
SLGAnswerEvaluatorTest class >> classNamesNotUnderTest [

	^ #(SLGDataAccessService)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:18'
}
SLGAnswerEvaluatorTest class >> test [ 
        ^self new run
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testCalculatePercentage [
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.

        "Test case 1: perfect match"
        result := evaluator calculatePercentage: 5 with: 5.
        self assert: result = 100.

        "Test case 2: partial match"
        result := evaluator calculatePercentage: 4 with: 5.
        self assert: result = 80.

        "Test case 3: no match"
        result := evaluator calculatePercentage: 0 with: 5.
        self assert: result = 0.

        "Test case 4: rounding"
        result := evaluator calculatePercentage: 1 with: 3.
        self assert: result = 33.

        "Test case 5: zero total (should handle division by zero)"
        self should: [evaluator calculatePercentage: 1 with: 0] raise: ZeroDivide.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithMatchingInput [
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hello'.
        self assert: result = 100.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithNonMatchingInput [
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hey'.
        result := evaluator calculateResult: 'world'.
        self assert: result = 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithPartialMatchingInput [
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hallo'.
        self assert: result = 80.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testVerifyAnswerWithInvalidInput [
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: ''.
        self assert: result = 'Invalid Input'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:42'
}
SLGAnswerEvaluatorTest >> testVerifyAnswerWithValidInput [ 
        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: 'hello'.
        self assert: result = 100.
]
