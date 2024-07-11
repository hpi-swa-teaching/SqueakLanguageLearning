"
This class creates answer slots for drag-and-drop templates.
"
Class {
	#name : #SLGAnswerSlotMorph,
	#superclass : #Morph,
	#instVars : [
		'label'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 18:43'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:13'
}
SLGAnswerSlotMorph class >> newWithLabel: aLabel [

	^self basicNew initializeWithLabel: aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:49'
}
SLGAnswerSlotMorph class >> slotExtent [
	^90px @ 40px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:12'
}
SLGAnswerSlotMorph >> initializeWithLabel: aLabel [

	self initialize.
	label := aLabel.
	
	self setup.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:15'
}
SLGAnswerSlotMorph >> label [

	^ label
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:49'
}
SLGAnswerSlotMorph >> setup [

	self color: Color white;
			extent: self class slotExtent;
			borderWidth: 2px;
			borderColor: Color darkGray;
			cornerStyle: #rounded;
			cornerRadius: 10px.
			
]
