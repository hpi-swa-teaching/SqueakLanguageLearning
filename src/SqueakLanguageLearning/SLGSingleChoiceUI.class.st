Class {
	#name : #SLGSingleChoiceUI,
	#superclass : #SLGMultipleChoiceUI,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/1/2024 13:16'
}
SLGSingleChoiceUI class >> newSingleChoiceUIwithTask: aSLGSingleChoiceTask [

 	^ self new
		task: aSLGSingleChoiceTask;
		taskQuestion: aSLGSingleChoiceTask question;
		setup;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/1/2024 14:05'
}
SLGSingleChoiceUI >> createToggleButtonAtPosition: aPosition [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition withButtonPressed: [self resetToggleButtons].
	"self toggleButtonList add: button."
	
	^ button
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 6/1/2024 13:32'
}
SLGSingleChoiceUI >> initialize [

	super initialize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/1/2024 14:07'
}
SLGSingleChoiceUI >> resetToggleButtons [

	self toggleButtonList do: [:each |
				each state: false.
				each update]
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 14:49'
}
SLGSingleChoiceUI >> validate [

	| userInput result |
	userInput := OrderedCollection new.
	self toggleButtonList do: [:each | userInput add: each state].
	result := self task validate: userInput.
	
	(result = 100)
		ifTrue: [self printSuccess]
		ifFalse: [self printFailure]
	
]
