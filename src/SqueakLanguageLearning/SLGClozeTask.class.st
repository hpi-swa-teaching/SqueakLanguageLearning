"
This class is the logic for the cloze task template.
"
Class {
	#name : #SLGClozeTask,
	#superclass : #SLGTask,
	#instVars : [
		'cloze'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 18:45'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:10'
}
SLGClozeTask class >> newClozeWithQuestion: aQuestionString withCloze: aClozeString withAnswer: anAnswerString withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
			cloze: aClozeString;
			correctAnswer: anAnswerString;
			yourself
	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:10'
}
SLGClozeTask class >> newClozeWithQuestion: aQuestionString withCode: aCodeString withCloze: aClozeString withAnswer: anAnswerString withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
        		code: aCodeString;
			cloze: aClozeString;
			correctAnswer: anAnswerString;
			yourself

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 16:50'
}
SLGClozeTask >> calculateResult: anUserInput [

	"Multiple spaces and capitalization are ignored."

	| modifiedInput modifiedAnswer output |
	
	modifiedInput := self removeSpacesAndLowercase: anUserInput.
	modifiedAnswer := (self removeSpacesAndLowercase: self correctAnswer).

	modifiedInput = modifiedAnswer
		ifTrue: [output := 100]
		ifFalse: [output := 0].
		
	^ output
	
	
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
	#category : #verification,
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
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:48'
}
SLGClozeTask >> isValid: aString [

	^ (self cloze = aString) not
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 5/31/2024 11:07'
}
SLGClozeTask >> removeSpacesAndLowercase: aString [

	^ (aString select: [:char | char isSeparator not]) asLowercase.

]
