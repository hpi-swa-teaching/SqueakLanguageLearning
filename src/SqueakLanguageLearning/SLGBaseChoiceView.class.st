"
This class has general properties on UI for both single and multiple choice.
"
Class {
	#name : #SLGBaseChoiceView,
	#superclass : #SLGTaskView,
	#instVars : [
		'toggleButtonList'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:31'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:00'
}
SLGBaseChoiceView class >> columnSpaceExtent [

	^ 0 @ 20
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:01'
}
SLGBaseChoiceView class >> heightFactor [

	^ 6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/10/2024 09:33'
}
SLGBaseChoiceView class >> isSingleChoice [

	self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:00'
}
SLGBaseChoiceView class >> rowSpaceExtent [

	^ 20 @ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/30/2024 15:18'
}
SLGBaseChoiceView class >> taskDescription [

	^ 'Choose the correct answers.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:40'
}
SLGBaseChoiceView class >> toggleButtonExtent [

	^ (25 px @ 25 px)
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 16:48'
}
SLGBaseChoiceView >> createText: anOption [

	^ SLGMultilineTextGen new
			setText: anOption;
			width: self class taskElementWidth - (self class heightFactor * (self class toggleButtonExtent x));
			color: Color black
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 16:43'
}
SLGBaseChoiceView >> createToggleButton [

	| toggleButton state |
	toggleButton := SLGToggleButtonGen new 
						extent: self class toggleButtonExtent.
		
	toggleButton stateUI: [
		toggleButton state ifTrue: [
			toggleButton color: SLGAbstractPage pastelGreen].

		toggleButton state ifFalse: [
			toggleButton color: Color white]].
	
	toggleButton onClickWithBlock: [
		self class isSingleChoice 
			ifTrue: [
				state := toggleButton state.
				self resetToggleButtons.
				toggleButton state: state]].
	
	^ toggleButton
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
	#'squeak_changestamp' : 'SW 7/11/2024 16:04'
}
SLGBaseChoiceView >> resetToggleButtons [

	self toggleButtonList do: [:each |
		each state: false.
		each updateUI]
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
	#'squeak_changestamp' : 'SW 7/11/2024 16:45'
}
SLGBaseChoiceView >> setupToggleButtons: anOptionArray [

	| rows cols |
	rows := anOptionArray collect: [:option |
		
		| row toggleButton text |
		toggleButton := self createToggleButton.
		self toggleButtonList add: toggleButton.
		text := self createText: option.
			
		row := SLGLayout rowWithMorphs: {
				toggleButton.
				SLGSpacerGen newSpacerWithDimension: self class rowSpaceExtent.
				text}.
		SLGLayout columnWithMorphs: {
			row.
			SLGSpacerGen newSpacerWithDimension: self class columnSpaceExtent}].

	cols := SLGLayout columnWithMorphs: rows.

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
