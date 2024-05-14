Class {
	#name : #SLGMenuPage,
	#superclass : #AbstractPage,
	#instVars : [
		'homepage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/13/2024 13:24'
}
SLGMenuPage >> backToHomepage [
	
	self hide.
	self homepage show
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/13/2024 12:17'
}
SLGMenuPage >> createBackButton [

	| backButton |
	backButton := SLGBackButton newGoBackButton: self.
	backButton center: self center.
	self addMorph: backButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:39'
}
SLGMenuPage >> homepage [
	^ homepage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:39'
}
SLGMenuPage >> homepage: aSLGHomepage [
	homepage := aSLGHomepage
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/13/2024 11:49'
}
SLGMenuPage >> initialize [
	
	super initialize.
	self createBackButton
	
]
