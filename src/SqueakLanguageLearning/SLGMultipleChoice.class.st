Class {
	#name : #SLGMultipleChoice,
	#superclass : #Morph,
	#instVars : [
		'description',
		'questions',
		'answers'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/18/2024 21:04'
}
SLGMultipleChoice class >> newMultipleChoiceWithDescription: aString withQuestions: aList1 withAnswers: aList2 [
	^self new
		description: aString;
		questions: aList1;
		answers: aList2;
		setup;
		yourself
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/18/2024 23:01'
}
SLGMultipleChoice class >> testMultipleChoice [
	|a|
	a := SLGMultipleChoice newMultipleChoiceWithDescription: 'Do we like Squeak?' 	withQuestions: #('Yes' 'No' 'Maybe') withAnswers: #(true false false).

	a openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 20:19'
}
SLGMultipleChoice >> addTextMorph [
	| textMorph |
	textMorph := StringMorph new.
	textMorph contents: self description.
	textMorph position: 50@50. "Set the position of the text morph within the base morph"
	self addMorph: textMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> answers [
	^ answers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> answers: anObject [
	answers := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> description [
	^ description
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> description: anObject [
	description := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 21:49'
}
SLGMultipleChoice >> initialize [
	super initialize.
	self
		extent: 600@400;
		color: Color veryVeryLightGray.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 22:24'
}
SLGMultipleChoice >> newTextElement: content at: position maxWidth: width [
	| textMorph |
	textMorph := TextMorph new
		contents: content;
		wrapFlag: true;
		extent: width@0;
		position: position;
		lock.
	self addMorph: textMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 22:52'
}
SLGMultipleChoice >> newToggleButtonWithState: state withPosition: position [
	|a|
	a := SLGToggleButton newToggleButtonWithState: false withPosition: position.
	self addMorph: a.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> questions [
	^ questions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 19:21'
}
SLGMultipleChoice >> questions: anObject [
	questions := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 22:57'
}
SLGMultipleChoice >> setup [
	self newTextElement: self description at: 0@0 maxWidth: 600.
	
	questions doWithIndex: [:each :i |
		|y margin toggleButtonWidth|
		margin := 10.
		toggleButtonWidth := 50.
		y := 100 + ((toggleButtonWidth+margin)*(i-1)).
		self newToggleButtonWithState: false withPosition: 0@y.
		self newTextElement: each at: (toggleButtonWidth+margin)@y maxWidth: 600.
	 ]
]
