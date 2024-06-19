Class {
	#name : #SLGUITest,
	#superclass : #TestCase,
	#classInstVars : [
		'testImagesUpload'
	],
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 19:26'
}
SLGUITest >> tearDown [

	super tearDown.
	World submorphs select: [:m | m isKindOf: SLGAbstractPage] thenDo: [:pageMorph | pageMorph delete]


]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 19:27'
}
SLGUITest >> testAppPageExtent [

	| page |

	page := SLGAbstractPage newWithController: SLGMainController new.	

	self assert: (page width = (1604 * 0.55) px).
	self assert: (page height = (1204 * 0.55) px)

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 19:27'
}
SLGUITest >> testImagesUpload [

	| page hasImageMorphs |

	page := SLGAbstractPage newWithController: SLGMainController new.	
	page addHomeButton;
			displayExperiencePoint;
			displaySubBadge;
			displayMainBadge.
	
	hasImageMorphs := page header submorphs anySatisfy: [:each | each isKindOf: ImageMorph].

	self assert: hasImageMorphs

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 19:28'
}
SLGUITest >> testResetButton [

	| page button |
	
	SLGUserProgress userData completed add: 'task1'.
	SLGUserProgress userData completed add: 'task2'.
				
	page := SLGAbstractPage newWithController: SLGMainController new.	
  	button := page footer submorphs detect: [:morph | morph isKindOf: PluggableButtonMorph].
	
	button actionSelector ifNotNil: [
        page perform: button actionSelector.
    	].

	self assert: (SLGUserProgress userData completed isEmpty).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 00:43'
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
	#'squeak_changestamp' : 'yegi 6/19/2024 00:47'
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
