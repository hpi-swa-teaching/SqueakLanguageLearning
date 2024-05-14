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
	#'squeak_changestamp' : 'yegi park 5/14/2024 14:41'
}
SLGMenuPage >> createBackButton [

	| backButton |
	backButton := SLGBackButton newGoBackButton: self.
	backButton center: self topLeft + (150@60); color: Color lightRed.
	self addMorph: backButton.
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
	#'squeak_changestamp' : 'yegi park 5/14/2024 14:43'
}
SLGMenuPage >> initialize [
	
	super initialize.
	self createBackButton.
	self extent: 450@900;
		color: Color veryVeryLightGray;
		borderWidth: 5;
		borderColor: Color veryLightGray;
		position: self topLeft.
]
