"
This class ensures the accuracy of user input verification for SLGTask by employing the Mock Object SLGAnswerEvaluator instead of directly interacting with SLGTask.
"
Class {
	#name : #SLGAnswerEvaluatorTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/5/2024 17:23'
}

{
	#category : #'test configuration',
	#'squeak_changestamp' : 'EB 6/17/2024 14:25'
}
SLGAnswerEvaluatorTest class >> classNamesNotUnderTest [

	^ #(SLGDataAccessService)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:36'
}
SLGAnswerEvaluatorTest >> testCalculatePercentageNoMatch [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        result := evaluator calculatePercentage: 0 with: 5.

        self assert: result = 0
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculatePercentagePartialMatch [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        result := evaluator calculatePercentage: 4 with: 5.

        self assert: result = 80
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculatePercentagePerfectMatch [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        result := evaluator calculatePercentage: 5 with: 5.

        self assert: result = 100
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculatePercentageRounding [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        result := evaluator calculatePercentage: 1 with: 3.

        self assert: result = 33
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculatePercentageZeroTotal [

        | evaluator |
        evaluator := SLGAnswerEvaluator new.

        self should: [evaluator calculatePercentage: 1 with: 0] raise: ZeroDivide
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithMatchingInput [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hello'.

        self assert: result = 100.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithNonMatchingInput [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hey'.
        result := evaluator calculateResult: 'world'.

        self assert: result = 0
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testCalculateResultWithPartialMatchingInput [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator calculateResult: 'hallo'.

        self assert: result = 80
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testVerifyAnswerWithInvalidInput [

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: ''.

        self assert: result = 'Invalid Input'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/5/2024 17:37'
}
SLGAnswerEvaluatorTest >> testVerifyAnswerWithValidInput [ 

        | evaluator result |
        evaluator := SLGAnswerEvaluator new.
        evaluator correctAnswer: 'hello'.
        result := evaluator verifyAnswer: 'hello'.

        self assert: result = 100
]
