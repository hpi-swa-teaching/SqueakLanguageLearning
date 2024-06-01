Class {
	#name : #SLGClozeTask,
	#superclass : #SLGTask,
	#instVars : [
		'answer',
		'question',
		'cloze'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 5/31/2024 10:56'
}
SLGClozeTask class >> newClozeWithQuestion: aQuestionString withCloze: aClozeString withAnswer: anAnswerString [

	^ self new
			question: aQuestionString;
			cloze: aClozeString;
			answer: anAnswerString;
			yourself
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:25'
}
SLGClozeTask >> answer [
	^ answer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:25'
}
SLGClozeTask >> answer: anObject [
	answer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:38'
}
SLGClozeTask >> cloze [
	^ cloze
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:39'
}
SLGClozeTask >> cloze: aString [
	cloze := aString
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/31/2024 10:22'
}
SLGClozeTask >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:25'
}
SLGClozeTask >> question [
	^ question
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:25'
}
SLGClozeTask >> question: anObject [
	question := anObject
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/31/2024 11:07'
}
SLGClozeTask >> removeSpacesAndLowercase: aString [

	^ (aString select: [:char | char isSeparator not]) asLowercase.

]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/31/2024 11:08'
}
SLGClozeTask >> validate: anUserInput [

	"Multiple Spraces and capitalization are ignored."

	| modifiedInput modifiedAnswer output |
	
	modifiedInput := self removeSpacesAndLowercase: anUserInput.
	modifiedAnswer := self removeSpacesAndLowercase: self answer.
	
	(modifiedInput = modifiedAnswer)
		ifTrue: [output := true]
		ifFalse: [output := false].
	
	^ output

]