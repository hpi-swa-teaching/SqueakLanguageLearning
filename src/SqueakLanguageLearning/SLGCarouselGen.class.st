Class {
	#name : #SLGCarouselGen,
	#superclass : #Morph,
	#instVars : [
		'currentIndex',
		'morphs',
		'cycle',
		'previousIndex'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/4/2024 18:24'
}
SLGCarouselGen class >> newCarouselWithMorphs: aList [

	^ self new
		morphs: aList;
		setup;
		update;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:12'
}
SLGCarouselGen >> back [

	self currentIndex: self decrementedIndex.
	self update
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:20'
}
SLGCarouselGen >> canSwitch [

	^ self shouldIncrementIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:29'
}
SLGCarouselGen >> currentIndex [
	^ currentIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:29'
}
SLGCarouselGen >> currentIndex: anObject [
	currentIndex := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 23:37'
}
SLGCarouselGen >> cycle [
	^ cycle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 23:37'
}
SLGCarouselGen >> cycle: anObject [
	cycle := anObject
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/4/2024 18:12'
}
SLGCarouselGen >> decrementedIndex [

	^ (self currentIndex - 1) \\ self morphsSize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:21'
}
SLGCarouselGen >> getCurrentMorph [

	| morph |
	
	morph := self morphs at: (self currentIndex + 1).
	morph center: self center.
	
	^ morph
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/4/2024 18:12'
}
SLGCarouselGen >> incrementedIndex [

	^ (self currentIndex + 1) \\ self morphsSize
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/4/2024 18:19'
}
SLGCarouselGen >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		currentIndex: 0;
		previousIndex: -1;
		cycle: false
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:09'
}
SLGCarouselGen >> isWithinBounds [

	^ (self currentIndex + 1) < self morphsSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:29'
}
SLGCarouselGen >> morphs [
	^ morphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:08'
}
SLGCarouselGen >> morphs: aListOfMorphs [
	morphs := aListOfMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:07'
}
SLGCarouselGen >> morphsSize [

	^ self morphs size
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:17'
}
SLGCarouselGen >> next [

	| newIndex |
	
	self shouldIncrementIndex
		ifTrue: [
				newIndex := self incrementedIndex.
				self currentIndex: newIndex].
			
	self update
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:07'
}
SLGCarouselGen >> notCycle [

	^ self cycle not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:12'
}
SLGCarouselGen >> previousIndex [
	^ previousIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:12'
}
SLGCarouselGen >> previousIndex: anObject [
	previousIndex := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:13'
}
SLGCarouselGen >> removeCurrentMorph [

	self removeMorph: self getCurrentMorph
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:14'
}
SLGCarouselGen >> setup [

	self 
		width: self getCurrentMorph width;
		height: self getCurrentMorph height
		
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:10'
}
SLGCarouselGen >> shouldIncrementIndex [

	^ ((self notCycle and: [self isWithinBounds]) or: [self cycle])
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/4/2024 18:15'
}
SLGCarouselGen >> update [

	self previousIndex < 0 
		ifTrue: [self previousIndex: 0].
		
	self removeMorph: (self morphs at: self previousIndex + 1).
	self addMorph: self getCurrentMorph.
	self previousIndex: self currentIndex
]
