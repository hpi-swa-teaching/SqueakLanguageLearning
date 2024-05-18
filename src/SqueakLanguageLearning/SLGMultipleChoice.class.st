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
	#'squeak_changestamp' : 'Alex 5/18/2024 20:21'
}
SLGMultipleChoice class >> newMultipleChoiceWithDescription: aString withQuestions: aList1 withAnswers: aList2 [
	^self new
		description: aString;
		questions: aList1;
		answers: aList2
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
	#'squeak_changestamp' : 'Alex 5/18/2024 20:33'
}
SLGMultipleChoice >> initialize [
	super initialize.
	Transcript show: self description.
	self
		extent: 600@400;
		color: Color veryVeryLightGray.
	Transcript show: self description.
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
