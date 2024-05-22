Class {
	#name : #SLGGapText,
	#superclass : #Morph,
	#instVars : [
		'description',
		'gapText',
		'answerText',
		'queryString',
		'answerString'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/22/2024 14:51'
}
SLGGapText class >> newGapText: aGapText with: anAnswerList [

	^ self new
		gapText: aGapText;
		answerText: anAnswerList;
		setup;
		yourself
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:31'
}
SLGGapText >> answerString [
	^ answerString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:32'
}
SLGGapText >> answerString: aTextMorph [
	answerString := aTextMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:28'
}
SLGGapText >> answerText [
	^ answerText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:28'
}
SLGGapText >> answerText: aString [
	answerText := aString
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 14:40'
}
SLGGapText >> compareStrings [

	"Multiple Spraces and capitalization are ignored."
	
	| currentString answerString|
	
	currentString := (self queryString contents asString select: [:char | char isSeparator not]) asLowercase.
	answerString := (self answerText select: [:char | char isSeparator not]) asLowercase.
	
	(currentString = answerString)
		ifTrue: [Transcript show: 'Success!'; cr.]
		ifFalse: [Transcript show: 'Wrong answer!'; cr.]
	
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 14:35'
}
SLGGapText >> createGapText [

	self queryString: (TextMorph new contents: self gapText).
	self queryString center: self center.
	
	self answerString: (TextMorph new contents: self answerText).
	
	self addMorph: self queryString
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 14:52'
}
SLGGapText >> createSubmitButton [

	| button |
	
	button := SimpleButtonMorph new.
	button label: 'Submit'.
	button position: self center + 50.
	button on: #mouseUp send: #compareStrings to: self.
	
	self addMorph: button
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:12'
}
SLGGapText >> gapText [
	^ gapText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:13'
}
SLGGapText >> gapText: aString [
	gapText := aString
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 14:58'
}
SLGGapText >> initialize [

	super initialize.
	self extent: 600 @ 450;
		color: Color veryVeryLightGray;
	 	center: Display center

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:31'
}
SLGGapText >> queryString [
	^ queryString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 14:32'
}
SLGGapText >> queryString: aTextMorph [
	queryString := aTextMorph
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 14:51'
}
SLGGapText >> setup [

	self createGapText.
	self createSubmitButton.
	self openInWorld	
	
]
