Class {
	#name : #SLGClozeTask,
	#superclass : #SLGTask,
	#instVars : [
		'cloze'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/8/2024 14:28'
}
SLGClozeTask class >> newClozeWithQuestion: aQuestionString withCloze: aClozeString withAnswer: anAnswerString [

	^ self new
			question: aQuestionString;
			cloze: aClozeString;
			correctAnswer: anAnswerString;
			yourself
	
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
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 14:40'
}
SLGClozeTask >> customizeInputAndAnswers: anUserInput [

	"Multiple Spraces and capitalization are ignored."

	| modifiedInput |
	
	modifiedInput := self removeSpacesAndLowercase: anUserInput.
	self correctAnswer: (self removeSpacesAndLowercase: self correctAnswer).
	
	^ modifiedInput
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
	#'squeak_changestamp' : 'SW 6/8/2024 14:54'
}
SLGClozeTask >> validate: anUserInput [

	"Multiple spaces and capitalization are ignored."

	| modifiedInput modifiedAnswer output |
	
	modifiedInput := self removeSpacesAndLowercase: anUserInput.
	modifiedAnswer := (self removeSpacesAndLowercase: self correctAnswer).

	modifiedInput = modifiedAnswer
		ifTrue: [output := 100]
		ifFalse: [output := 0].
		
	^ output
	
	
]
