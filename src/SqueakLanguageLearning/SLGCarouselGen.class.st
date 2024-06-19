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
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:15'
}
SLGCarouselGen >> back [
	self currentIndex: (self currentIndex - 1) \\ (self morphs size).
	self update.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:37'
}
SLGCarouselGen >> canSwitch [
	((self cycle not) and: ((self currentIndex + 1) < (self morphs size))) ifTrue: [
		^true
	].
	self cycle ifTrue: [
		^true
	].
	
	^false
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
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:28'
}
SLGCarouselGen >> getCurrentMorph [
	| morph |
	morph := self morphs at: (self currentIndex + 1).
	morph center: self center.
	^morph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:38'
}
SLGCarouselGen >> handler [
	self addMorph: self getCurrentMorph.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:20'
}
SLGCarouselGen >> initializeWithMorphs: aList [
	super initialize.
	self morphs: aList.
	self currentIndex: 0.
	self previousIndex: -1.
	self cycle: false.
	self color: Color transparent.
	self width: self getCurrentMorph width.
	self height: self getCurrentMorph height.
	self update.
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
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:29'
}
SLGCarouselGen >> morphs: anObject [
	morphs := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:15'
}
SLGCarouselGen >> next [
	((self cycle not) and: ((self currentIndex + 1) < (self morphs size))) ifTrue: [
		self currentIndex: (self currentIndex + 1) \\ (self morphs size).
	].
	self cycle ifTrue: [
		self currentIndex: (self currentIndex + 1) \\ (self morphs size).
	].
	self update.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 19:39'
}
SLGCarouselGen >> removeCurrentMorph [
	self removeMorph: self getCurrentMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:31'
}
SLGCarouselGen >> update [
	self previousIndex < 0 ifTrue: [self previousIndex: 0].
	self removeMorph: (self morphs at: self previousIndex + 1).
	self addMorph: self getCurrentMorph.
	self previousIndex: self currentIndex.
]
