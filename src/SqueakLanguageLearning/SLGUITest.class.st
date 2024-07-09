"
This class focuses on validating user interface behaviors like button actions and task outcome display across integrated test scenarios.
"
Class {
	#name : #SLGUITest,
	#superclass : #TestCase,
	#instVars : [
		'page'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/6/2024 13:26'
}

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 13:46'
}
SLGUITest >> setUp [

	super setUp.
	
	page := SLGAbstractPage newWithController: SLGMainController new
]

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 13:45'
}
SLGUITest >> tearDown [	

	World submorphs select: [:morph | morph isKindOf: SLGAbstractPage] 
								thenDo: [:pageMorph | pageMorph delete].
	
	super tearDown
	
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:30'
}
SLGUITest >> testAppPageExtent [		

	self assert: (page width = (1604 * 0.55) px).	
	self assert: (page height = (1204 * 0.55) px)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:30'
}
SLGUITest >> testImagesUpload [	

	| hasImageMorphs |		

	hasImageMorphs := page header submorphs anySatisfy: [:each | each isKindOf: ImageMorph].	

	self assert: hasImageMorphs
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:01'
}
SLGUITest >> testResetButton [	
	
	| button |		
	SLGUserProgress userData completed add: 'task1'.	
	SLGUserProgress userData completed add: 'task2'.					
		 	
	button := page footer submorphs detect: [:morph | morph isKindOf: PluggableButtonMorph].		
	button actionSelector ifNotNil: [ page perform: button actionSelector. ].	
		
	self assert: (SLGUserProgress userData completed isEmpty)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:01'
}
SLGUITest >> testStatusErrorCloze [
	
	| clozeTask clozeView |	   
      clozeTask := SLGClozeTask newClozeWithQuestion: '' 
									withCloze: 'The class of x is __.' 
									withAnswer: 'The class of x is Integer.' 
									withID: 'test1'.

	clozeView := SLGClozeView newClozeUIwithTask: clozeTask.
	clozeView verifyAnswer.
	
	self assert: (clozeView status contents = 'Please change xx to your answer.')
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:01'
}
SLGUITest >> testStatusErrorDragAndDrop [
	
	| dragDropTask dragDropView |	   
     dragDropTask := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'                                   
									withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')                                   
									withID: 'Task1'.

	dragDropView := SLGDragAndDropView newWithTask: dragDropTask.
	dragDropView verifyAnswer.
	
	self assert: (dragDropView status contents = 'Please position all of the given items.')
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:04'
}
SLGUITest >> testStatusErrorMultipleChoice [		
	
	| task choiceView |	   		 			      
	task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?'                                          
									withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')                                          
									withAnswers: #('Dog' 'Whale')                                          
									withID: 'Task4'.	
	
	choiceView := SLGMultipleChoiceView newMultipleChoiceUIwithTask: task.	
	choiceView verifyAnswer.	
			
	self assert: (choiceView status contents = 'Please choose at least one answer.')
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:04'
}
SLGUITest >> testStatusErrorSingleChoice [
	
	| task choiceView |	   		 		      
	task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Which of the following are mammals?'                                          
									withOptions: #('Dog' 'Snake' 'Eagle')                                          
									withAnswers: #('Dog')                                          
									withID: 'Task4'.	
	
	choiceView := SLGSingleChoiceView newSingleChoiceUIwithTask: task.		
	choiceView verifyAnswer.	
			
	self assert: (choiceView status contents = 'Please choose an answer.')
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:28'
}
SLGUITest >> testStatusFailureUI [	
	
	| taskView |	    	
	taskView := SLGTaskView new.	
	
	taskView status: (taskView createTextFieldWithContent: '' withBorder: false).	
	taskView statusDisplay: (taskView createStatusField).	
	taskView result: 50.	
	taskView checkResult.					
	
	self assert: (taskView status contents = 'Wrong Answer! Please try again.').	
	self assert: (taskView statusDisplay color = taskView class lightPastelRed)
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:28'
}
SLGUITest >> testStatusSuccessUI [	
	
	| taskView testTask |	   
	taskView := SLGTaskView new.
	
	taskView status: (taskView createTextFieldWithContent: '' withBorder: false).	
	taskView statusDisplay: (taskView createStatusField).		
			
	testTask := SLGDragAndDropTask newWithQuestion: 'Test Question'                                
										withCorrectAnswer: #('Option 1' 'Option 2' 'Option 3')                                
										withID: 'TestId'.
									
	taskView task: testTask.	
	taskView result: 100.	
	taskView checkResult.					
						
	self assert: (taskView status contents = 'Success!').	
	self assert: (taskView statusDisplay color = taskView class lightPastelGreen)
]
