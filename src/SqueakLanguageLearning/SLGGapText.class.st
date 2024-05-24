Class {
	#name : #SLGGapText,
	#superclass : #Morph,
	#instVars : [
		'description',
		'gapText',
		'answerText',
		'queryString',
		'answerString',
		'statusText'
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
	#'squeak_changestamp' : 'SW 5/22/2024 15:43'
}
SLGGapText >> compareStrings [

	"Multiple Spraces and capitalization are ignored."
	
	| currentString answerString|
	
	currentString := (self queryString contents asString select: [:char | char isSeparator not]) asLowercase.
	answerString := (self answerText select: [:char | char isSeparator not]) asLowercase.
	
	(currentString = answerString)
		ifTrue: [self statusText contents: 'Success!'. Transcript show: 'Success!'; cr.]
		ifFalse: [self statusText contents: 'Wrong Answer!'. Transcript show: 'Wrong answer!'; cr.]
	
	
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
	#'squeak_changestamp' : 'SW 5/22/2024 15:22'
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/22/2024 16:00'
}
SLGGapText >> newTextElement: content at: aPosition maxWidth: width [

	| textMorph |
	textMorph := TextMorph new
		contents: content;
		wrapFlag: true;
		extent: width@0;
		center: aPosition;
		lock.
	self addMorph: textMorph.
	^ textMorph
	
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
	#'squeak_changestamp' : 'SW 5/22/2024 16:04'
}
SLGGapText >> setup [

	self createGapText.
	self createSubmitButton.
	self statusText: (self newTextElement: ' ' at: (self center + (0@130)) maxWidth: 170). 
	self openInWorld	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 15:35'
}
SLGGapText >> statusText [
	^ statusText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/22/2024 15:35'
}
SLGGapText >> statusText: anObject [
	statusText := anObject
]
