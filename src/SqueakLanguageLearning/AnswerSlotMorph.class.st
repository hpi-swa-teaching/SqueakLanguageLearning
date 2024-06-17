Class {
	#name : #AnswerSlotMorph,
	#superclass : #Morph,
	#instVars : [
		'label'
	],
	#category : #'SqueakLanguageLearning-Tasks'
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
	#'squeak_changestamp' : 'yegi 6/16/2024 01:49'
}
AnswerSlotMorph class >> slotExtent [
	^90px @ 40px
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
	#'squeak_changestamp' : 'yegi 6/16/2024 01:49'
}
AnswerSlotMorph >> setup [

	self color: Color white;
			extent: self class slotExtent;
			borderWidth: 2px;
			borderColor: Color darkGray;
			cornerStyle: #rounded;
			cornerRadius: 10px.
			
]
