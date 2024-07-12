"
This class verifies the correct functionality of logic creation within the model of SqueakLanguageLearning, including tasks and related subtopics.
"
Class {
	#name : #SLGModelTest,
	#superclass : #TestCase,
	#instVars : [
		'originalUserProgress',
		'mockUserProgress',
		'mockUserData'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/5/2024 17:46'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 14:37'
}
SLGModelTest class >> classNamesNotUnderTest [

	^ #(SLGDataAccessService)
]

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:48'
}
SLGModelTest >> setUp [
	
	super setUp.
	originalUserProgress := SLGUserProgress userData copy.
	mockUserProgress := SLGUserProgress new.
	SLGUserProgress userData: mockUserProgress. 
	mockUserData := SLGUserProgress userData
]

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:48'
}
SLGModelTest >> tearDown [	
	
	SLGUserProgress userData: originalUserProgress
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:05'
}
SLGModelTest >> testClozeTask [

	| task |
    	task := SLGClozeTask newClozeWithQuestion: 'Test Question'
						withCode: ''
                                    withCloze: 'Test Cloze'
                                    withAnswer: 'Test Answer'
                                    withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task cloze = 'Test Cloze'.
    	self assert: task correctAnswer = 'Test Answer'.
    	self assert: task id = 'TestId'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:09'
}
SLGModelTest >> testDragAndDropTask [ 

	| task |
	task := SLGDragAndDropTask newWithQuestion: 'Test Question'
					withCode: ''
					withCorrectAnswer: #('Option 1' 'Option 2' 'Option 3')
                              withID: 'TestId'.
    
	self assert: task question = 'Test Question'.
    	self assert: task correctAnswer = #('Option 1' 'Option 2' 'Option 3').
    	self assert: task id = 'TestId'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:31'
}
SLGModelTest >> testLessonIsCompleted [

	| lesson task |
	task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?' 
					withCode: '' 
					withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')
					withAnswers: #(true false true false)
					withID: 'Task1'.
					
      SLGUserProgress userData completed add: 'Task1'.
	lesson := SLGLesson newWithTask: task.
	
	self assert: lesson isCompleted
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:05'
}
SLGModelTest >> testLessonWithClozeTask [ 

        | lesson task |
        task := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
							withCode: ''
                                     	withCloze: 'fox'
                                     	withAnswer: 'fox'
                                     	withID: 'Task2'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:09'
}
SLGModelTest >> testLessonWithDragAndDropTask [

        | lesson task |
        task := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
						withCode: ''
                                   	withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   	withID: 'Task1'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 14:59'
}
SLGModelTest >> testLessonWithMultipleChoiceTask [ 

        | lesson task |
        task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?'
							withCode: ''
                                          withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')
                                          withAnswers: #(true false true false)
                                          withID: 'Task4'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:02'
}
SLGModelTest >> testLessonWithSingleChoiceTask [

        | lesson task |
        task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the capital of France?'
								withCode: ''
                                         		withOptions: #('London' 'Paris' 'Berlin' 'Madrid')
                                         		withAnswers: #(false true false false)
                                         		withID: 'Task3'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:00'
}
SLGModelTest >> testMultipleChoiceTask [
	
	| task |
    	task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Test Question'
							withCode: ''
                                          withOptions: #('Option 1' 'Option 2' 'Option 3' 'Option 4')
                                          withAnswers: #(true false true false)
                                          withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task answerOptions = #('Option 1' 'Option 2' 'Option 3' 'Option 4').
    	self assert: task correctAnswer = #(true false true false).
    	self assert: task id = 'TestId'

]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:02'
}
SLGModelTest >> testSingleChoiceTask [
	
	| task |
    	task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Test Question'
							withCode: ''
                                    	withOptions: #('Option 1' 'Option 2' 'Option 3')
                                   		withAnswers: #(true false false false)
                                   		withID: 'TestId'.
    
    	self assert: task question = 'Test Question'.
    	self assert: task answerOptions = #('Option 1' 'Option 2' 'Option 3').
    	self assert: task correctAnswer = #(true false false false).
    	self assert: task id = 'TestId'
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:10'
}
SLGModelTest >> testSubtopicIsCompleted [

        | subtopic lesson1 lesson2 task1 task2 |
        task1 := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
						 withCode: ''
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task1'.
        SLGUserProgress userData completed add: 'Task1'.

        task2 := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
						withCode: ''
                                   	withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   	withID: 'Task2'.
        SLGUserProgress userData completed add: 'Task2'.

        lesson1 := SLGLesson newWithTask: task1.
        lesson2 := SLGLesson newWithTask: task2.

        subtopic := SLGSubtopic newWithTitle: 'Sample Subtopic' andLessons: {lesson1. lesson2}.

        self assert: subtopic isCompleted

]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:10'
}
SLGModelTest >> testSubtopicWithLessons [

        | subtopic lesson1 lesson2 task1 task2 |
        task1 := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
						 withCode: ''
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task1'.
        
        task2 := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
						withCode: ''
                                   	withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   	withID: 'Task2'.

        lesson1 := SLGLesson newWithTask: task1.
        lesson2 := SLGLesson newWithTask: task2.

        subtopic := SLGSubtopic newWithTitle: 'Sample Subtopic' andLessons: {lesson1. lesson2}.

        self assert: subtopic title = 'Sample Subtopic'.
        self assert: subtopic lessons = {lesson1. lesson2}
    
]
