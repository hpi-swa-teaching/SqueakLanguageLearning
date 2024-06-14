Class {
	#name : #AnswerEvaluatorTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:18'
}
AnswerEvaluatorTest class >> test [ 
        ^self new run
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:25'
}
AnswerEvaluatorTest >> testCalculatePercentage [
        | evaluator result |
        evaluator := AnswerEvaluator new.

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
	#'squeak_changestamp' : 'EB 6/14/2024 11:24'
}
AnswerEvaluatorTest >> testCalculateResultWithMatchingInput [
        | evaluator result |
        evaluator := AnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hello'.
        self assert: result = 100.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:24'
}
AnswerEvaluatorTest >> testCalculateResultWithNonMatchingInput [
        | evaluator result |
        evaluator := AnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'world'.
        self assert: result = 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:24'
}
AnswerEvaluatorTest >> testCalculateResultWithPartialMatchingInput [
        | evaluator result |
        evaluator := AnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hallo'.
        self assert: result = 80.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:26'
}
AnswerEvaluatorTest >> testVerifyAnswerWithInvalidInput [
        | evaluator result |
        evaluator := AnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: ''.
        self assert: result = 'Invalid Input'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 11:26'
}
AnswerEvaluatorTest >> testVerifyAnswerWithValidInput [ 
        | evaluator result |
        evaluator := AnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: 'hello'.
        self assert: result = 100.
]
