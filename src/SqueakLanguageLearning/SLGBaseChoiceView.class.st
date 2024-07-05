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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 16:18'
}
SLGBaseChoiceView >> setup [
	
	|interactive|
	interactive :=	self setupToggleButtons: self task answerOptions.
	
	super setupWith: interactive
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/5/2024 09:40'
}
SLGBaseChoiceView >> setupToggleButtons: anOptionArray [

	| rows cols |

	rows := anOptionArray collect: [:option |
		
		| row toggleBtn text |
		
		toggleBtn := SLGToggleButtonGen new
			extent: self class baseChoiceButtonExtent;
			borderWidth: 2px;
			borderColor: Color white;
			cornerStyle: #rounded;
			cornerRadius: 30;
			color: Color white.
		
		toggleBtn stateUI:  [
			toggleBtn state ifTrue: [
				toggleBtn color: SLGAbstractPage pastelGreen.
			].

			toggleBtn state ifFalse: [
				toggleBtn color: Color white.
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
			width: self class taskElementWidth - (6 * (self class baseChoiceButtonExtent x));
			color: Color black.
			
		row := SLGLayout rowWithMorphs: 
			{
				toggleBtn.
				SLGSpacerGen newSpacerWithDimension: (20 @ 0).
				text
			}.
		
		SLGLayout columnWithMorphs: {
			row.
			SLGSpacerGen newSpacerWithDimension: (0 @ 20)
		}
	].

	cols := SLGLayout columnWithMorphs: rows.
	
	"cols center: (self center x @ self headerLowerBound).
	self addMorph: cols."
	^ cols
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
