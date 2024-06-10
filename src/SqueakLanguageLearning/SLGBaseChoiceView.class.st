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
	#'squeak_changestamp' : 'SW 6/10/2024 09:33'
}
SLGBaseChoiceView class >> isSingleChoice [

	self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/30/2024 15:18'
}
SLGBaseChoiceView class >> taskDescription [

	^ 'Choose the correct answers.'
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
	#'squeak_changestamp' : 'SW 6/10/2024 09:23'
}
SLGBaseChoiceView >> resetToggleButtons [

	self toggleButtonList do: [:each |
		each state: false.
		each updateUI.
	]
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/10/2024 09:20'
}
SLGBaseChoiceView >> setup [

	super setup.
	
	self setupToggleButtons: self task answerOptions
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 12:02'
}
SLGBaseChoiceView >> setupToggleButtons: anOptionArray [

	| rows cols |

	rows := anOptionArray collect: [:option |
		
		| row toggleBtn text |
		
		toggleBtn := SLGToggleButtonGen new
			extent: (50@50);
			borderWidth: 10;
			color: Color gray.
		
		toggleBtn stateUI:  [
			toggleBtn state ifTrue: [
				toggleBtn color: Color green.
			].

			toggleBtn state ifFalse: [
				toggleBtn color: Color gray.
			].
		].
	
		toggleBtn onClickWithBlock: [
			| state |
			
			self class isSingleChoice ifTrue: [
				state := toggleBtn state.
				self resetToggleButtons.
				toggleBtn state: state.
			].
		].
	
		self toggleButtonList add: toggleBtn.
		
		text := SLGMultilineTextGen new
			setText: option;
			width: 400;
			color: Color black.
			
		row := SLGLayout rowWithMorphs: 
			{
				toggleBtn.
				SLGSpacerGen newSpacerWithDim: (20@0).
				text
			}.
		
		SLGLayout columnWithMorphs: {
			row.
			SLGSpacerGen newSpacerWithDim: (0@20)
		}
	].

	cols := SLGLayout columnWithMorphs: rows.
	
	cols center: (self center x@self staticLowerBound).
	self addMorph: cols.
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
