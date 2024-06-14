Class {
	#name : #SLGModelTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 12:17'
}
SLGModelTest >> testClozeTask [

	| task |
	
    	task := SLGClozeTask newClozeWithQuestion: 'Test Question'
                                    withCloze: 'Test Cloze'
                                    withAnswer: 'Test Answer'
                                    withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task cloze = 'Test Cloze'.
    	self assert: task correctAnswer = 'Test Answer'.
    	self assert: task id = 'TestId'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 12:17'
}
SLGModelTest >> testDragAndDropTask [ 

	| task |
	task := SLGDragAndDropTask newWithQuestion: 'Test Question'
                                withCorrectAnswer: #('Option 1' 'Option 2' 'Option 3')
                                withID: 'TestId'.
    
	self assert: task question = 'Test Question'.
    	self assert: task correctAnswer = #('Option 1' 'Option 2' 'Option 3').
    	self assert: task id = 'TestId'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/11/2024 13:59'
}
SLGModelTest >> testModel [

	self assert: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 12:20'
}
SLGModelTest >> testMultipleChoiceTask [
	
	| task |
    	task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Test Question'
                                          withOptions: #('Option 1' 'Option 2' 'Option 3' 'Option 4')
                                          withAnswers: #('Option 1' 'Option 3')
                                          withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task answerOptions = #('Option 1' 'Option 2' 'Option 3' 'Option 4').
    	self assert: task correctAnswer = #('Option 1' 'Option 3').
    	self assert: task id = 'TestId'.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 12:19'
}
SLGModelTest >> testSingleChoiceTask [
	
	| task |
    	task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Test Question'
                                      withOptions: #('Option 1' 'Option 2' 'Option 3')
                                      withAnswers: #('Option 1')
                                      withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task answerOptions = #('Option 1' 'Option 2' 'Option 3').
    	self assert: task correctAnswer = #('Option 1').
    	self assert: task id = 'TestId'.
]
