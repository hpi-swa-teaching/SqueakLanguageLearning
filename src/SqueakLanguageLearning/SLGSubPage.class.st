Class {
	#name : #SLGSubPage,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'homepage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/13/2024 13:24'
}
SLGSubPage >> backToHomepage [
	
	self hide.
	self homepage show
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/13/2024 12:17'
}
SLGSubPage >> createBackButton [

	| backButton |
	backButton := SLGBackButton newGoBackButton: self.
	backButton center: self center.
	self addMorph: backButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:39'
}
SLGSubPage >> homepage [
	^ homepage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:39'
}
SLGSubPage >> homepage: aSLGHomepage [
	homepage := aSLGHomepage
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/21/2024 10:07'
}
SLGSubPage >> initialize [
	
	super initialize.
	self createBackButton
	
]
