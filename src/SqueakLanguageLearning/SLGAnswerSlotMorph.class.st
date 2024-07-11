"
This class represents the slot to put drag an item to for SLGDragAndDropView.
"
Class {
	#name : #SLGAnswerSlotMorph,
	#superclass : #Morph,
	#instVars : [
		'label'
	],
	#category : 'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 18:43'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:36'
}
SLGAnswerSlotMorph class >> newWithLabel: aLabel [

	^ self new
		label: aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:35'
}
SLGAnswerSlotMorph class >> slotBorderColor [
	^ Color darkGray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:34'
}
SLGAnswerSlotMorph class >> slotBorderWidth [
	^ 2 px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:34'
}
SLGAnswerSlotMorph class >> slotCornerRadius [
	^ 10 px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:49'
}
SLGAnswerSlotMorph class >> slotExtent [
	^90px @ 40px
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 14:35'
}
SLGAnswerSlotMorph >> initialize [

	super initialize.

	self 
		color: Color white;
		extent: self class slotExtent;
		borderWidth: self class slotBorderWidth;
		borderColor: self class slotBorderColor;
		cornerStyle: #rounded;
		cornerRadius: self class slotCornerRadius
			
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:10'
}
SLGAnswerSlotMorph >> label [
	^ label
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:33'
}
SLGAnswerSlotMorph >> label: aString [
	label := aString
]
