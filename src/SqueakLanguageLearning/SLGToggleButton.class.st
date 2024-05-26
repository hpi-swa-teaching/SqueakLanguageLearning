Class {
	#name : #SLGToggleButton,
	#superclass : #SLGButton,
	#instVars : [
		'state',
		'buttonPressed'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/26/2024 13:35'
}
SLGToggleButton class >> newToggleButtonWithState: aBoolean withPosition: aPoint withButtonPressed: aBlock [
	^self new
		state: aBoolean;
		position: aPoint;
		buttonPressed: aBlock;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/26/2024 13:32'
}
SLGToggleButton >> buttonPressed [
	^ buttonPressed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/26/2024 13:32'
}
SLGToggleButton >> buttonPressed: anObject [
	buttonPressed := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/18/2024 22:56'
}
SLGToggleButton >> initialize [
	super initialize.
	self color: Color gray.
	self label: ''.
	self extent: 50@50.
	self target: [self onPressed].
	self actionSelector: #value.
	self borderWidth: 10.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/26/2024 13:54'
}
SLGToggleButton >> onPressed [
	self buttonPressed value.
	self toggle.
	self update
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 22:06'
}
SLGToggleButton >> state [
	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 22:06'
}
SLGToggleButton >> state: anObject [
	state := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/18/2024 22:42'
}
SLGToggleButton >> toggle [
	self state: (self state) not
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/18/2024 22:42'
}
SLGToggleButton >> update [
	state ifTrue: [
		self color: Color green.
	].

	state ifFalse: [
		self color: Color gray.
	]
]
