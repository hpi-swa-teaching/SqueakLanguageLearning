Class {
	#name : #SLGModelTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 14:37'
}
SLGModelTest class >> classNamesNotUnderTest [

	^ #(SLGDataAccessService)
]

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
	#'squeak_changestamp' : 'EB 6/14/2024 18:33'
}
SLGModelTest >> testLessonIsCompleted [

        | lesson task |

        task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?'
                                          withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')
                                          withAnswers: #('Dog' 'Whale')
                                          withID: 'Task1'.
        SLGUserProgress userData completed add: 'Task1'.

        lesson := SLGLesson newWithTask: task.
        self assert: lesson isCompleted.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:30'
}
SLGModelTest >> testLessonWithClozeTask [ 

        | lesson task |
        task := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task2'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:30'
}
SLGModelTest >> testLessonWithDragAndDropTask [

        | lesson task |
        task := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
                                   withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   withID: 'Task1'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:31'
}
SLGModelTest >> testLessonWithMultipleChoiceTask [ 

        | lesson task |
        task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?'
                                          withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')
                                          withAnswers: #('Dog' 'Whale')
                                          withID: 'Task4'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:31'
}
SLGModelTest >> testLessonWithSingleChoiceTask [

        | lesson task |
        task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the capital of France?'
                                         withOptions: #('London' 'Paris' 'Berlin' 'Madrid')
                                         withAnswers: #('Paris')
                                         withID: 'Task3'.
        lesson := SLGLesson newWithTask: task.

        self assert: lesson task = task.
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:42'
}
SLGModelTest >> testSubtopicIsCompleted [
        | subtopic lesson1 lesson2 task1 task2 |

        task1 := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task1'.
        SLGUserProgress userData completed add: 'Task1'.

        task2 := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
                                   withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   withID: 'Task2'.
        SLGUserProgress userData completed add: 'Task2'.

        lesson1 := SLGLesson newWithTask: task1.
        lesson2 := SLGLesson newWithTask: task2.

        subtopic := SLGSubtopic newWithTitle: 'Sample Subtopic' andLessons: {lesson1. lesson2}.

        self assert: subtopic isCompleted.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:45'
}
SLGModelTest >> testSubtopicOnTaskCompleted [
        | subtopic lesson task transcriptOutput |

        task := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task1'.

        lesson := SLGLesson newWithTask: task.

        subtopic := SLGSubtopic newWithTitle: 'Sample Subtopic' andLessons: {lesson}.

        "Simulate task completion"
        SLGUserProgress userData completed add: 'Task1'.
        task triggerEvent: #taskCompleted.

        "Capture transcript output"
        transcriptOutput := String streamContents: [ :stream |
            Transcript show: stream.
            subtopic onTaskCompleted.
        ].

        self assert: (transcriptOutput includesSubstring: 'You have earned a badge for a subtopic ').

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:40'
}
SLGModelTest >> testSubtopicWithLessons [

        | subtopic lesson1 lesson2 task1 task2 |

        task1 := SLGClozeTask newClozeWithQuestion: 'Fill in the blank: The quick brown ___ jumps over the lazy dog.'
                                     withCloze: 'fox'
                                     withAnswer: 'fox'
                                     withID: 'Task1'.
        
        task2 := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'
                                   withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')
                                   withID: 'Task2'.

        lesson1 := SLGLesson newWithTask: task1.
        lesson2 := SLGLesson newWithTask: task2.

        subtopic := SLGSubtopic newWithTitle: 'Sample Subtopic' andLessons: {lesson1. lesson2}.

        self assert: subtopic title = 'Sample Subtopic'.
        self assert: subtopic lessons = {lesson1. lesson2}.
    
]
