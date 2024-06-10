Class {
	#name : #SLGSpacerGen,
	#superclass : #Morph,
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 16:01'
}
SLGSpacerGen class >> newSpacerWithDim: aPoint [
	^self new
		extent: aPoint;
		yourself. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 17:29'
}
SLGSpacerGen >> initialize [
	super initialize.
	self color: Color red.
]
