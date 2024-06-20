Class {
	#name : #SLGUITest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:10'
}
SLGUITest >> tearDown [	
	
	super tearDown.	
	World submorphs select: [:m | m isKindOf: SLGAbstractPage] 
								thenDo: [:pageMorph | pageMorph delete]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:12'
}
SLGUITest >> testAppPageExtent [	

	| page |	
		
	page := SLGAbstractPage newWithController: SLGMainController new.		

	self assert: (page width = (1604 * 0.55) px).	
	self assert: (page height = (1204 * 0.55) px)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:12'
}
SLGUITest >> testImagesUpload [	

	| page hasImageMorphs |	
		
	page := SLGAbstractPage newWithController: SLGMainController new.		

	hasImageMorphs := page header submorphs anySatisfy: [:each | each isKindOf: ImageMorph].	

	self assert: hasImageMorphs
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:13'
}
SLGUITest >> testResetButton [	
	
	| page button |		
			
	SLGUserProgress userData completed add: 'task1'.	
	SLGUserProgress userData completed add: 'task2'.					
						
	page := SLGAbstractPage newWithController: SLGMainController new.	 
		 	
	button := page footer submorphs detect: [:morph | morph isKindOf: PluggableButtonMorph].		
	button actionSelector ifNotNil: [ page perform: button actionSelector. ].	
		
	self assert: (SLGUserProgress userData completed isEmpty).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 01:22'
}
SLGUITest >> testStatusErrorUI [
	
	| taskView clozeTask clozeView |	   
		 	
	taskView := SLGTaskView new.
	
	taskView status: (taskView createTextFieldWithContent: '' withBorder: false).	
	taskView statusDisplay: (taskView createStatusField).
	
      clozeTask := SLGClozeTask newClozeWithQuestion: '' 
									withCloze: 'The class of x is __.' 
									withAnswer: 'The class of x is Integer.' 
									withID: 'test1'.

	clozeView := SLGClozeView newClozeUIwithTask: clozeTask.
	clozeView status: taskView status.
	clozeView statusDisplay: taskView statusDisplay.
	clozeView setup.
	clozeView verifyAnswer.
	
	self assert: (clozeView status contents = 'Please change xx to your answer.').	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:14'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:28'
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
