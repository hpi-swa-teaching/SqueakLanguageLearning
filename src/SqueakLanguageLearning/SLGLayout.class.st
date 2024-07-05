"
This class is a lightweight wrapper for TableLayout. It takes a list of morphs as an argument and returns a new morph with the elements ordered in a specific direction.
"
Class {
	#name : #SLGLayout,
	#superclass : #Morph,
	#instVars : [
		'direction',
		'morphs',
		'gapSize'
	],
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:22'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/4/2024 18:45'
}
SLGLayout class >> columnWithMorphs: anArray [

	^ self new
		morphs: anArray;
		direction: #bottomToTop;
		gapSize: 0;
		setupColumns;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/4/2024 19:02'
}
SLGLayout class >> columnWithMorphs: anArray withGap: aNumber [

	^ self new
		morphs: anArray;
		direction: #bottomToTop;
		gapSize: aNumber;
		setupColumns;
		yourself

]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/4/2024 18:57'
}
SLGLayout class >> columnWithMorphsReversed: anArray withGap: aNumber [
	
	^ self new
		morphs: anArray;
		direction: #topToBottom;
		gapSize: aNumber;
		setupColumns;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:59'
}
SLGLayout class >> layoutColor [

	^ Color transparent
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/4/2024 18:47'
}
SLGLayout class >> rowWithMorphs: anArray [
	
	^ self new
		morphs: anArray;
		direction: #rightToLeft;
		setupRows;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:58'
}
SLGLayout >> calculateMaxHeight [

	^ self morphs inject: 0 into: [:currentMaximum :morph | currentMaximum max: morph height]

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:59'
}
SLGLayout >> calculateMaxWidth [

	^ self morphs inject: 0 into: [:currentMaximum :morph | currentMaximum max: morph width]

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:59'
}
SLGLayout >> calculateSumHeight [

	^ self morphs inject: 0 into: [:sum :morph | sum + morph height]

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:59'
}
SLGLayout >> calculateSumWidth [

	^ self morphs inject: 0 into: [:sum :morph | sum + morph width]

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:34'
}
SLGLayout >> direction [
	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:35'
}
SLGLayout >> direction: aSymbol [
	direction := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:34'
}
SLGLayout >> gapSize [
	^ gapSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:35'
}
SLGLayout >> gapSize: aNumber [
	gapSize := aNumber
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 10:00'
}
SLGLayout >> initialize [

	super initialize.
	
	self 
		layoutPolicy: TableLayout new;
		color: self class layoutColor
		
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:34'
}
SLGLayout >> morphs [
	^ morphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:45'
}
SLGLayout >> morphs: anArrayOfMorphs [
	morphs := anArrayOfMorphs
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 19:01'
}
SLGLayout >> setup [

	self
		listDirection: self direction;
		cellGap: self gapSize.
		
	self morphs do: [:each | self addMorph: each]

]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 19:00'
}
SLGLayout >> setupColumns [

	self setup.
	self 
		width: self calculateMaxWidth;
		height: self calculateSumHeight
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 19:00'
}
SLGLayout >> setupRows [

	self setup.
	self 
		width: self calculateSumWidth;
		height: self calculateMaxHeight
]
