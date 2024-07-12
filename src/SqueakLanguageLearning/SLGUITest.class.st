"
This class focuses on validating user interface behaviors like button actions and task outcome display across integrated test scenarios.
"
Class {
	#name : #SLGUITest,
	#superclass : #TestCase,
	#instVars : [
		'page',
		'originalUserProgress',
		'mockUserProgress',
		'mockUserData'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/6/2024 13:26'
}

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:47'
}
SLGUITest >> setUp [
	
	super setUp.
	originalUserProgress := SLGUserProgress userData copy.
	mockUserProgress := SLGUserProgress new.
	SLGUserProgress userData: mockUserProgress. 
	mockUserData := SLGUserProgress userData.
      
	page := SLGAbstractPage newDefaultWithController: SLGMainController new
]

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:42'
}
SLGUITest >> tearDown [	
	
	SLGUserProgress userData: originalUserProgress.	
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
	#'squeak_changestamp' : 'EB 7/11/2024 21:54'
}
SLGUITest >> testResetButton [	
	
	| button |		
	mockUserData completed add: 'task1'.	
	mockUserData completed add: 'task2'.
	Transcript show: 'Completed tasks in mock after adding test data: ', (mockUserData completed asArray printString); cr.					
		 	
	button := page footer submorphs detect: [:morph | morph isKindOf: PluggableButtonMorph].		
	button actionSelector ifNotNil: [ page perform: button actionSelector ].	
	Transcript show: 'Completed tasks in mockUserData after reset action: ', (mockUserData completed asArray printString); cr.
	Transcript show: 'Completed tasks in SLGUserProgress after reset action: ', (SLGUserProgress userData completed asArray printString); cr.
	self assert: (SLGUserProgress userData completed isEmpty).
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:06'
}
SLGUITest >> testStatusErrorCloze [
	
	| clozeTask clozeView |	   
      clozeTask := SLGClozeTask newClozeWithQuestion: '' 
									withCode: ''
									withCloze: 'The class of x is __.' 
									withAnswer: 'The class of x is Integer.' 
									withID: 'test1'.

	clozeView := SLGClozeView newClozeUIwithTask: clozeTask.
	clozeView verifyAnswer.
	
	self assert: (clozeView status contents = 'Please change xx to your answer.')
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:10'
}
SLGUITest >> testStatusErrorDragAndDrop [
	
	| dragDropTask dragDropView |	   
     dragDropTask := SLGDragAndDropTask newWithQuestion: 'Arrange the words in alphabetical order'             
									withCode: ''                      
									withCorrectAnswer: #('apple' 'banana' 'cherry' 'date')                                   
									withID: 'Task1'.

	dragDropView := SLGDragAndDropView newWithTask: dragDropTask.
	dragDropView verifyAnswer.
	
	self assert: (dragDropView status contents = 'Please position all of the given items.')
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:00'
}
SLGUITest >> testStatusErrorMultipleChoice [		
	
	| task choiceView |	   		 			      
	task := SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Which of the following are mammals?'      
									withCode: ''                                    
									withOptions: #('Dog' 'Snake' 'Whale' 'Eagle')                                          
									withAnswers: #('Dog' 'Whale')                                          
									withID: 'Task4'.	
	
	choiceView := SLGMultipleChoiceView newMultipleChoiceUIwithTask: task.	
	choiceView verifyAnswer.	
			
	self assert: (choiceView status contents = 'Please choose at least one answer.')
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/11/2024 15:02'
}
SLGUITest >> testStatusErrorSingleChoice [
	
	| task choiceView |	   		 		      
	task := SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Which of the following are mammals?'        
									withCode: ''                                  
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
	#'squeak_changestamp' : 'SW 7/11/2024 15:10'
}
SLGUITest >> testStatusSuccessUI [	
	
	| taskView testTask |	   
	taskView := SLGTaskView new.
	
	taskView status: (taskView createTextFieldWithContent: '' withBorder: false).	
	taskView statusDisplay: (taskView createStatusField).		
			
	testTask := SLGDragAndDropTask newWithQuestion: 'Test Question'
										withCode: ''                         
										withCorrectAnswer: #('Option 1' 'Option 2' 'Option 3')                                
										withID: 'TestId'.
									
	taskView task: testTask.	
	taskView result: 100.	
	taskView checkResult.					
						
	self assert: (taskView status contents = 'Success!').	
	self assert: (taskView statusDisplay color = taskView class lightPastelGreen)
]
