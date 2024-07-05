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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGToggleButtonGen >> initialize [

	super initialize.
	
	self state: false.
	self label: ' '
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
