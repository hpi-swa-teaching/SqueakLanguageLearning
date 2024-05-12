Class {
	#name : #SLGSubpage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/11/2024 19:26'
}
SLGSubpage >> backToHomepage [
	SLGHomepage open.
	self delete
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/10/2024 12:10'
}
SLGSubpage >> createBackButton [
	|backButton|
	backButton := SimpleButtonMorph new.
	backButton label:  'Back to Homepage'.
	backButton on: #mouseUp send: #backToHomepage to: self.
	backButton position: ((self width - backButton width)/2)@0.
	self addMorph: backButton
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/10/2024 16:56'
}
SLGSubpage >> initialize [
	
	super initialize.
	self color: Color white;
		extent: 600@900.
	self createBackButton
	
]
