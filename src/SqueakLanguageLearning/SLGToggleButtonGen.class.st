"
This class represents selections for SLGBaseChoiceView intercations. When clicked, a toggle button visually indicates ist active state through a color change.
"
Class {
	#name : #SLGToggleButtonGen,
	#superclass : #SLGButtonGen,
	#instVars : [
		'state',
		'stateUI'
	],
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:47'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:30'
}
SLGToggleButtonGen class >> toggleButtonBorderColor [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:30'
}
SLGToggleButtonGen class >> toggleButtonBorderWidth [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:31'
}
SLGToggleButtonGen class >> toggleButtonColor [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 16:31'
}
SLGToggleButtonGen class >> toggleButtonCornerRadius [

	^ 30
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 16:40'
}
SLGToggleButtonGen >> initialize [

	super initialize.
	
	self 
		borderWidth: self class toggleButtonBorderWidth;
		borderColor: self class toggleButtonBorderColor;
		cornerStyle: #rounded;
		cornerRadius: self class toggleButtonCornerRadius;
		color: self class toggleButtonColor;
		label: ' '.
		
	self state: false
	
	
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SW 7/5/2024 09:43'
}
SLGToggleButtonGen >> onClickWithBlock: aBlock [

	self callback: [
		self toggle.	
		aBlock value.
		self updateUI]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:40'
}
SLGToggleButtonGen >> state [
	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:37'
}
SLGToggleButtonGen >> state: aBoolean [
	state := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:17'
}
SLGToggleButtonGen >> stateUI [
	^ stateUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:41'
}
SLGToggleButtonGen >> stateUI: aBlock [
	stateUI := aBlock
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SW 7/5/2024 09:43'
}
SLGToggleButtonGen >> toggle [

	self state: (self state) not
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SW 7/5/2024 09:43'
}
SLGToggleButtonGen >> updateUI [

	self stateUI value
]
