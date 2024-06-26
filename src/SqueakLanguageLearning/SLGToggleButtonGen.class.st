Class {
	#name : #SLGToggleButtonGen,
	#superclass : #SLGButtonGen,
	#instVars : [
		'state',
		'stateUI'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:49'
}
SLGToggleButtonGen class >> testToggleButton [
	| toggleBtn |

	toggleBtn := SLGToggleButtonGen new.
	
	toggleBtn onClickWithBlock: [
		toggleBtn state ifTrue: [
			toggleBtn color: Color blue.
		].

		toggleBtn state ifFalse: [
			toggleBtn color: Color green.
		].
	].

	toggleBtn extent: (100@100).

	toggleBtn openInHand.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 17:14'
}
SLGToggleButtonGen >> initialize [
	super initialize.
	self state: false.
	self label: ' '.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:15'
}
SLGToggleButtonGen >> onClickWithBlock: aBlock [
	self callback: [
		self toggle.	
		aBlock value.
		self updateUI.
	].
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
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:40'
}
SLGToggleButtonGen >> state: anObject [
	state := anObject
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
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:17'
}
SLGToggleButtonGen >> stateUI: anObject [
	stateUI := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:45'
}
SLGToggleButtonGen >> toggle [
	self state: (self state) not
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:17'
}
SLGToggleButtonGen >> updateUI [
	self stateUI value.
]
