Class {
	#name : #AnswerSlotMorph,
	#superclass : #Morph,
	#instVars : [
		'label'
	],
	#category : #'MyOwnCategory-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:13'
}
AnswerSlotMorph class >> newWithLabel: aLabel [

	^self basicNew initializeWithLabel: aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:12'
}
AnswerSlotMorph >> initializeWithLabel: aLabel [

	self initialize.
	label := aLabel.
	
	self setup.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:15'
}
AnswerSlotMorph >> label [

	^ label
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:12'
}
AnswerSlotMorph >> setup [

	self color: Color lightGray;
			extent: 150 @ 100;
			borderWidth: 2;
			borderColor: Color black.
			
]
