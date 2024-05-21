Class {
	#name : #SLGMultipleChoice,
	#superclass : #Morph,
	#instVars : [
		'description',
		'questions',
		'answers',
		'toggleButtonList',
		'statusText'
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
	#'squeak_changestamp' : 'Alex 5/19/2024 00:08'
}
SLGMultipleChoice class >> testMultipleChoice [
	|a|
	a := SLGMultipleChoice newMultipleChoiceWithDescription: 'Do we like Squeak?' 	withQuestions: #('Yes' 'No' 'Maybe') withAnswers: #(true true false).

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
	#'squeak_changestamp' : 'Alex 5/18/2024 23:24'
}
SLGMultipleChoice >> initialize [
	super initialize.
	self
		extent: 600@400;
		color: Color veryVeryLightGray;
		toggleButtonList: OrderedCollection new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/19/2024 00:03'
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
	^ textMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 23:34'
}
SLGMultipleChoice >> newToggleButtonWithState: state withPosition: position [
	|a|
	a := SLGToggleButton newToggleButtonWithState: false withPosition: position.
	self addMorph: a.
	self toggleButtonList add: a.
	
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
	#'squeak_changestamp' : 'Alex 5/19/2024 00:04'
}
SLGMultipleChoice >> setup [
	| submitButton y |	
	self newTextElement: self description at: 0@0 maxWidth: 600.
	
	y := 100.
	questions doWithIndex: [:each :i |
		|margin toggleButtonWidth|
		margin := 10.
		toggleButtonWidth := 50.
		
		self newToggleButtonWithState: false withPosition: 0@y.
		self newTextElement: each at: (toggleButtonWidth+margin)@y maxWidth: 600.
		
		Transcript show: y; cr.
	
		y :=  y + (toggleButtonWidth+margin).
	 ].
	submitButton := SLGButton new
		label: 'Submit';
		position: 0@(y+10).
	submitButton target: [self validate].
	submitButton actionSelector: #value.
	self addMorph: submitButton.
	
	self statusText: (self newTextElement: ' ' at: 0@(y+10+60) maxWidth: 600).
	
	
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 23:57'
}
SLGMultipleChoice >> statusText [
	^ statusText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 23:57'
}
SLGMultipleChoice >> statusText: anObject [
	statusText := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 23:23'
}
SLGMultipleChoice >> toggleButtonList [
	^ toggleButtonList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/18/2024 23:23'
}
SLGMultipleChoice >> toggleButtonList: anObject [
	toggleButtonList := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/19/2024 00:26'
}
SLGMultipleChoice >> validate [
	| foundWrongAnswer correctCounter totalCounter percentage |
	foundWrongAnswer := false.
	correctCounter := 0.0.
	totalCounter := 0.0.
	self toggleButtonList doWithIndex: [:each :i |
		|current expected|
		current := each state.
		expected := (self answers at: i).
		
		current == expected ifFalse: [
				foundWrongAnswer := true.
				correctCounter > 0 ifTrue: [
					correctCounter := correctCounter - 1
				]
		].
	
		current == expected  ifTrue: [
			current ifTrue: [
				correctCounter := correctCounter + 1.
			]
		].
		
		totalCounter := totalCounter + 1.0
	].

	percentage := correctCounter / totalCounter.
	
	percentage := (percentage * 100) truncated.

	foundWrongAnswer ifTrue: [
		self statusText contents: ('Wrong answer :( [', percentage, '% correct]')
	].

	foundWrongAnswer ifFalse: [
		self statusText contents: 'Correct answer :)'
	]
]
