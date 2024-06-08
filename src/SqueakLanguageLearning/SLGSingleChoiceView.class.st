Class {
	#name : #SLGSingleChoiceView,
	#superclass : #SLGMultipleChoiceView,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/1/2024 13:16'
}
SLGSingleChoiceView class >> newSingleChoiceUIwithTask: aSLGSingleChoiceTask [

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
SLGSingleChoiceView >> createToggleButtonAtPosition: aPosition [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition withButtonPressed: [self resetToggleButtons].
	"self toggleButtonList add: button."
	
	^ button
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:05'
}
SLGSingleChoiceView >> initialize [

	super initialize.
	self singleChoice: true.
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 14:49'
}
SLGSingleChoiceView >> validate [

	| userInput result |
	userInput := OrderedCollection new.
	self toggleButtonList do: [:each | userInput add: each state].
	result := self task validate: userInput.
	
	(result = 100)
		ifTrue: [self printSuccess]
		ifFalse: [self printFailure]
	
]
