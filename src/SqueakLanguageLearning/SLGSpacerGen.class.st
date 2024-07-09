"
This class can be used to have additional margins or padding behavior within SLGLayout.
"
Class {
	#name : #SLGSpacerGen,
	#superclass : #Morph,
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:24'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/5/2024 08:44'
}
SLGSpacerGen class >> newSpacerWithDimension: aPoint [
 
	^ self new
		extent: aPoint;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:56'
}
SLGSpacerGen class >> spacerColor [

	^ Color red
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 09:56'
}
SLGSpacerGen >> initialize [

	super initialize.
	
	self color: self class spacerColor
]
