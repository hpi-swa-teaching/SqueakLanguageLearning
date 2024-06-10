Class {
	#name : #SLGMultipleChoiceView,
	#superclass : #SLGTaskView,
	#instVars : [
		'toggleButtonList',
		'singleChoice'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:33'
}
SLGMultipleChoiceView class >> errorMessage [

	^ 'Please choose at least one answer.'
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/8/2024 16:42'
}
SLGMultipleChoiceView class >> newMultipleChoiceUIwithTask: aSLGMultipleChoiceTask [

 	^ self new
		task: aSLGMultipleChoiceTask;
		taskQuestion: aSLGMultipleChoiceTask question;
		setup;
		yourself
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:22'
}
SLGMultipleChoiceView >> initialize [

	super initialize.
	self singleChoice: false.
	self toggleButtonList: OrderedCollection new
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 14:06'
}
SLGMultipleChoiceView >> printFailure [

	self printFailureWithPercentage: self result
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/1/2024 14:50'
}
SLGMultipleChoiceView >> printFailureWithPercentage: aPercentage [

	self status contents: ((self class failureMessage), ' [', aPercentage asString, '% correct]')
	
	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:22'
}
SLGMultipleChoiceView >> resetToggleButtons [
	self toggleButtonList do: [:each |
		each state: false.
		each updateUI.
	]
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 17:21'
}
SLGMultipleChoiceView >> setup [

	super setup.
	
	self setupToggleButtons: self task answerOptions
	
	
	
	

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:20'
}
SLGMultipleChoiceView >> setupToggleButtons: anOptionArray [
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
			
			self singleChoice ifTrue: [
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
	
	cols center: self center.
	self addMorph: cols.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:04'
}
SLGMultipleChoiceView >> singleChoice [
	^ singleChoice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:04'
}
SLGMultipleChoiceView >> singleChoice: anObject [
	singleChoice := anObject
]
