Class {
	#name : #SLGMultipleChoice,
	#superclass : #Object,
	#instVars : [
		'description',
		'questions',
		'answers',
		'toggleButtonList',
		'statusText',
		'exercisePage'
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
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:11'
}
SLGMultipleChoice class >> newMultipleChoiceWithDescription: aString withQuestions: aList1 withAnswers: aList2 onSubpage: aSubpage [ 
	
	^self new
		description: aString;
		questions: aList1;
		answers: aList2;
		exercisePage: aSubpage;
		setupExercisepage;
		yourself
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/21/2024 12:20'
}
SLGMultipleChoice class >> pageMargin [

	^ (self class pageSize) x / 60.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/21/2024 12:16'
}
SLGMultipleChoice class >> pageSize [

	^ 600@400.
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
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 13:35'
}
SLGMultipleChoice >> exercisePage [
	^ exercisePage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 13:43'
}
SLGMultipleChoice >> exercisePage: anSLGSubpage [
	exercisePage := anSLGSubpage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:20'
}
SLGMultipleChoice >> initialize [
	super initialize.
	self
		toggleButtonList: OrderedCollection new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 13:41'
}
SLGMultipleChoice >> newTextElement: aContent at: aPosition maxWidth: aWidth [
	| textMorph |
	textMorph := TextMorph new
		contents: aContent;
		wrapFlag: true;
		extent: aWidth@0;
		"position: position;"
		lock.
	(self exercisePage) addMorph: textMorph.
	textMorph position: (self exercisePage) position + aPosition.
	^ textMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:01'
}
SLGMultipleChoice >> newTextElement: aContent at: aPosition maxWidth: aWidth onPage: anExercisepage [
	| textMorph |
	textMorph := TextMorph new
		contents: aContent;
		wrapFlag: true;
		extent: aWidth@0;
		"position: position;"
		lock.
	anExercisepage addMorph: textMorph.
	textMorph position: anExercisepage position + aPosition.
	^ textMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 13:42'
}
SLGMultipleChoice >> newToggleButtonWithState: aState withPosition: aPosition [
	|a|
	a := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition.
	(self exercisePage) addMorph: a.
	self toggleButtonList add: a.
	a position: ((self exercisePage) position) + aPosition.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:00'
}
SLGMultipleChoice >> newToggleButtonWithState: aState withPosition: aPosition onPage: anExercisepage [
	|a|
	a := SLGToggleButton newToggleButtonWithState: false withPosition: aPosition.
	anExercisepage addMorph: a.
	self toggleButtonList add: a.
	a position: (anExercisepage position) + aPosition.
	
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
	#'squeak_changestamp' : 'xiaoshi 5/21/2024 12:42'
}
SLGMultipleChoice >> setup [
	| submitButton y|
	self newTextElement: self description at: 0@0 maxWidth:600.
	
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
		label: 'Submit'.
	submitButton target: [self validate].
	submitButton actionSelector: #value.
	self addMorph: submitButton.
	submitButton position: self position + (0@(y+10)).
	
	self statusText: (self newTextElement: ' ' at: 0@(y+10+60) maxWidth: 600).
	
	
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:05'
}
SLGMultipleChoice >> setupExercisepage [
	|myExercisePage submitButton y|
	myExercisePage := self exercisePage.
	self newTextElement: self description at: 0@0 maxWidth:600 onPage: myExercisePage.
	
	y := 100.
	questions doWithIndex: [:each :i |
		|margin toggleButtonWidth|
		margin := 10.
		toggleButtonWidth := 50.
		
		self newToggleButtonWithState: false withPosition: 0@y onPage: myExercisePage.
		self newTextElement: each at: (toggleButtonWidth+margin)@y maxWidth: 600 onPage: myExercisePage.
		
		Transcript show: y; cr.
	
		y :=  y + (toggleButtonWidth+margin).
	 ].
	submitButton := SLGButton new
		label: 'Submit'.
	submitButton target: [self validate].
	submitButton actionSelector: #value.
	myExercisePage addMorph: submitButton.
	submitButton position: myExercisePage position + (0@(y+10)). "can the relative position be defined bfore adding to a parent morph?"
	
	self statusText: (self newTextElement: ' ' at: 0@(y+10+60) maxWidth: 600 onPage: myExercisePage).
	
	
	

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
