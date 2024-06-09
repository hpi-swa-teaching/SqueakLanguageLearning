Class {
	#name : #SLGMultipleChoiceView,
	#superclass : #SLGTaskView,
	#instVars : [
		'toggleButtonList'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:32'
}
SLGMultipleChoiceView class >> newMultipleChoiceUIwithTask: aSLGMultipleChoiceTask [

 	^ self new
		task: aSLGMultipleChoiceTask;
		code: aSLGMultipleChoiceTask code;
		taskQuestion: aSLGMultipleChoiceTask question;
		setup";".
		"yourself"
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/30/2024 15:18'
}
SLGMultipleChoiceView class >> taskDescription [

	^ 'Choose the correct answers.'
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/29/2024 17:02'
}
SLGMultipleChoiceView >> createToggleButton [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false.
	self toggleButtonList add: button
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 13:45'
}
SLGMultipleChoiceView >> createToggleButtonAtPosition: aPosition [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition.
	"self toggleButtonList add: button."
	
	^ button
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/30/2024 17:27'
}
SLGMultipleChoiceView >> initialize [

	super initialize.
	
	self toggleButtonList: OrderedCollection new
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 14:50'
}
SLGMultipleChoiceView >> printFailureWithPercentage: aPercentage [

	self status contents: ((self class failureMessage), ' [', aPercentage asString, '% correct]')
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 12:17'
}
SLGMultipleChoiceView >> setup [

	super setup.
	
	self setupToggleButtons: self task answerOptions
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 11:54'
}
SLGMultipleChoiceView >> setupToggleButtons: anOptionArray [

	| yPos toggle toggleDescription |

	yPos := 150.
	anOptionArray do: [:option |
		
		toggle := self createToggleButtonAtPosition: (self position + (150 @ yPos)).
		self toggleButtonList add: toggle.
		
		toggleDescription := TextMorph new contents: option.
		toggleDescription position: (toggle center + (toggle width @ ((toggle height - toggleDescription height)/2 negated))).

		self addMorph: toggle.
		self addMorph: toggleDescription.
		yPos := yPos + 100].

	
	
	
	

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:58'
}
SLGMultipleChoiceView >> toggleButtonList [
	^ toggleButtonList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGMultipleChoiceView >> toggleButtonList: anOrderedCollection [
	toggleButtonList := anOrderedCollection
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 12:27'
}
SLGMultipleChoiceView >> validate [

	| userInput result |
	
	userInput := OrderedCollection new.
	self toggleButtonList do: [:each | userInput add: each state].
	result := self task validate: userInput.
	
	(result = 100)
		ifTrue: [self printSuccess]
		ifFalse: [self printFailureWithPercentage: result]
	
	
]
