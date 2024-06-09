Class {
	#name : #SLGBaseChoiceView,
	#superclass : #SLGTaskView,
	#instVars : [
		'toggleButtonList'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/30/2024 15:18'
}
SLGBaseChoiceView class >> taskDescription [

	^ 'Choose the correct answers.'
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/29/2024 17:02'
}
SLGBaseChoiceView >> createToggleButton [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false.
	self toggleButtonList add: button
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 13:45'
}
SLGBaseChoiceView >> createToggleButtonAtPosition: aPosition [

	| button |
	button := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition.
	"self toggleButtonList add: button."
	
	^ button
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/30/2024 17:27'
}
SLGBaseChoiceView >> initialize [

	super initialize.
	
	self toggleButtonList: OrderedCollection new
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 13:55'
}
SLGBaseChoiceView >> passUserInput [

	| userInput |
	userInput := OrderedCollection new.
	self toggleButtonList do: [:each | userInput add: each state].
	
	^ userInput
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 12:17'
}
SLGBaseChoiceView >> setup [

	super setup.
	
	self setupToggleButtons: self task answerOptions
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 11:54'
}
SLGBaseChoiceView >> setupToggleButtons: anOptionArray [

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
SLGBaseChoiceView >> toggleButtonList [
	^ toggleButtonList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/29/2024 16:59'
}
SLGBaseChoiceView >> toggleButtonList: anOrderedCollection [
	toggleButtonList := anOrderedCollection
]
