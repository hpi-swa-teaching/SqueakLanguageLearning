Class {
	#name : #SLGMultipleChoice,
	#superclass : #Object,
	#instVars : [
		'description',
		'questions',
		'answers',
		'toggleButtonList',
		'statusText',
		'exercisePage',
		'singleChoice'
	],
	#category : 'SqueakLanguageLearning'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:36'
}
SLGMultipleChoice class >> newMultipleChoiceWithDescription: aString withQuestions: aList1 withAnswers: aList2 withSingleChoice: aBoolean on: anExercisePage [
	^self new
		description: aString;
		questions: aList1;
		answers: aList2;
		singleChoice: aBoolean;
		exercisePage: anExercisePage;
		setup;
		yourself
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex 5/26/2024 13:59'
}
SLGMultipleChoice class >> testMultipleChoice [
	|a|
	a := SLGMultipleChoice newMultipleChoiceWithDescription: 'Do we like Squeak?' 	withQuestions: #('Yes' 'No' 'Maybe') withAnswers: #(true false false) withSingleChoice: false.

	a openInWorld
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
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 00:32'
}
SLGMultipleChoice >> newTextElement: aContent at: aPosition maxWidth: aWidth onPage: anExercisepage [
	| textMorph |
	textMorph := TextMorph new
		contents: aContent;
		wrapFlag: true;
		extent: aWidth@0;
		lock.
	anExercisepage addMorph: textMorph.
	textMorph position: anExercisepage position + aPosition.
	^ textMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:38'
}
SLGMultipleChoice >> newToggleButtonWithState: state withPosition: position withButtonPressed: aBlock onPage: aSubpage [
	|a|
	a := SLGToggleButton newToggleButtonWithState: false withPosition: (aSubpage position + position) withButtonPressed: aBlock.
	aSubpage addMorph: a.
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
	#'squeak_changestamp' : 'SW 6/1/2024 13:46'
}
SLGMultipleChoice >> resetToggleButtons [

	self singleChoice
		ifTrue: [self toggleButtonList doWithIndex: [:each :i |
				each state: false.
				each update]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 13:46'
}
SLGMultipleChoice >> setup [
	|myExercisePage submitButton y myPageExtent|
	myExercisePage := self exercisePage.
	myPageExtent := myExercisePage class pageExtent.
	self newTextElement: self description at: 0@0 maxWidth:1200 onPage: myExercisePage.
	
	y := 100.
	questions doWithIndex: [:each :i |
		|margin toggleButtonWidth|
		margin := 10.
		toggleButtonWidth := 50. 
		
		self newToggleButtonWithState: false withPosition: 0@y withButtonPressed: [
			self resetToggleButtons] onPage: myExercisePage.
		self newTextElement: each at: (toggleButtonWidth+margin)@y maxWidth: 600 onPage: myExercisePage.
	
		y :=  y + (toggleButtonWidth+margin).
	 ].
	submitButton := SLGButton new
		label: 'Submit'.
	submitButton target: [self validate].
	submitButton actionSelector: #value.
	myExercisePage addMorph: submitButton.
	submitButton position: myExercisePage position + (0@(y+10)).
	
	self statusText: (self newTextElement: ' ' at: 0@(y+10+60) maxWidth: 600 onPage: myExercisePage).
	
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/26/2024 13:25'
}
SLGMultipleChoice >> singleChoice [
	^ singleChoice
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex 5/26/2024 13:25'
}
SLGMultipleChoice >> singleChoice: anObject [
	singleChoice := anObject
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
