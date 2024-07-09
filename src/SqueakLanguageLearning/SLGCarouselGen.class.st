"
This class enables displaying a list of morphs as a so called ""carousel"". A carousel is a UI component, which displays only one morph at a time and let's the implementor call a next or a back method to iterate over the list of morphs.
"
Class {
	#name : #SLGCarouselGen,
	#superclass : #Morph,
	#instVars : [
		'currentIndex',
		'morphs',
		'cycle',
		'previousIndex'
	],
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:21'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 10:00'
}
SLGCarouselGen class >> carouselColor [

	^ Color transparent
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:55'
}
SLGCarouselGen class >> initialIndex [

	^ 0
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/5/2024 09:27'
}
SLGCarouselGen class >> newCarouselWithMorphs: anArray [

	^ self new
		morphs: anArray;
		setup;
		update;
		yourself
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> back [

	self currentIndex: self wrappedDecrementedIndex.
	self update
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
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
	#'squeak_changestamp' : 'SW 7/5/2024 09:41'
}
SLGCarouselGen >> currentIndex: aNumber [
	currentIndex := aNumber
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
	#category : #'index-manipulation',
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> decrementedIndex [

	^ self currentIndex - 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 17:38'
}
SLGCarouselGen >> getCurrentMorph [

	| morph |
	morph := self morphs at: self incrementedIndex.
	morph center: self center.
	
	^ morph
]

{
	#category : #'index-manipulation',
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> incrementedIndex [

	^ self currentIndex + 1
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 10:00'
}
SLGCarouselGen >> initialize [

	super initialize.
	
	self 
		color: self class carouselColor;
		currentIndex: self class initialIndex;
		previousIndex: self currentIndex - 1;
		cycle: false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:05'
}
SLGCarouselGen >> isWithinBounds [

	^ self incrementedIndex < self morphsSize
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
	#'squeak_changestamp' : 'SW 7/5/2024 09:18'
}
SLGCarouselGen >> morphs: anArrayOfMorphs [
	morphs := anArrayOfMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> morphsSize [

	^ self morphs size
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/5/2024 17:38'
}
SLGCarouselGen >> next [

	| newIndex |
	self shouldIncrementIndex
		ifTrue: [
				newIndex := self wrappedIncrementedIndex.
				self currentIndex: newIndex].
			
	self update
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
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
	#'squeak_changestamp' : 'SW 7/5/2024 09:42'
}
SLGCarouselGen >> previousIndex: aNumber [
	previousIndex := aNumber
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/5/2024 09:26'
}
SLGCarouselGen >> setup [

	self 
		width: self getCurrentMorph width;
		height: self getCurrentMorph height
		
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:10'
}
SLGCarouselGen >> shouldIncrementIndex [

	^ ((self notCycle and: [self isWithinBounds]) or: [self cycle])
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> update [

	self previousIndex < 0 
		ifTrue: [self previousIndex: 0].
		
	self removeMorph: (self morphs at: self previousIndex + 1).
	self addMorph: self getCurrentMorph.
	self previousIndex: self currentIndex
]

{
	#category : #'index-manipulation',
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> wrappedDecrementedIndex [

	^ self decrementedIndex \\ self morphsSize
]

{
	#category : #'index-manipulation',
	#'squeak_changestamp' : 'SW 7/5/2024 09:44'
}
SLGCarouselGen >> wrappedIncrementedIndex [

	^ self incrementedIndex \\ self morphsSize
]
