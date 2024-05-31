Class {
	#name : #SLGMultipleChoiceUI,
	#superclass : #SLGTaskUI,
	#instVars : [
		'toggleButtonList'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 5/31/2024 10:14'
}
SLGMultipleChoiceUI class >> newMultipleChoiceUIwithTask: aSLGMultipleChoiceTask [

 	^ self new
		task: aSLGMultipleChoiceTask;
		taskQuestion: aSLGMultipleChoiceTask question;
		setup;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/30/2024 15:18'
}
SLGMultipleChoiceUI class >> taskDescription [

	^ 'Choose the correct answers.'
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/29/2024 17:02'
}
SLGMultipleChoiceUI >> createToggleButton [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false.
	self toggleButtonList add: button
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/30/2024 17:27'
}
SLGMultipleChoiceUI >> initialize [

	super initialize.
	
	self toggleButtonList: OrderedCollection new
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 09:31'
}
SLGMultipleChoiceUI >> setup [

	"1. Description 2. Question 3. ToogleButtons 4. Status 5. SubmitButton"
	super setup.
	
	"self description contents: self class taskDescription.
	self question contents: self task question."
	self setupToggleButtons: self task answerOptions
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:03'
}
SLGMultipleChoiceUI >> setupToggleButtons: anOptionArray [

	| container yPos toggle toggleDescription |
	"container := Morph new.
	container
		color: Color transparent;
		position: (self position)."

	yPos := 150.
	anOptionArray do: [:option |
		"toggle := self createToggleButton. 
		toggle position: (self position + (50 @ yPos))."
		toggle := SLGToggleButton newToggleButtonWithState: false withPosition: (self position + (150@yPos)).
		self toggleButtonList add: toggle.
		
		toggleDescription := self createTextFieldWithContent: option withBorder: false.
		toggleDescription position: (toggle position + (toggle width + (20 @ 0))).
	
		"container addMorph: toggle.
		container addMorph: toggleDescription."
		self addMorph: toggle.
		self addMorph: toggleDescription.
		yPos := yPos + 100].

	"self addMorph: container"
	
	
	
	

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:58'
}
SLGMultipleChoiceUI >> toggleButtonList [
	^ toggleButtonList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGMultipleChoiceUI >> toggleButtonList: anOrderedCollection [
	toggleButtonList := anOrderedCollection
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/30/2024 22:04'
}
SLGMultipleChoiceUI >> validate [

	| userInput result |
	userInput := OrderedCollection new.
	self toggleButtonList do: [:each | userInput add: each state].
	result := self task validate: userInput.
	
	(result = 100)
		ifTrue: [self status contents: 'Success!']
		ifFalse: [self status contents: ('Wrong answer! ', result asString, '%')]
	
	
]
