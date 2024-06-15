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
	#'squeak_changestamp' : 'yegi 6/15/2024 13:09'
}
AnswerSlotMorph >> setup [

	self color: Color white;
			extent: 100px @ 40px;"90;"
			borderWidth: 2px;
			borderColor: Color darkGray;
			cornerStyle: #rounded;
			cornerRadius: 10.
			
]
