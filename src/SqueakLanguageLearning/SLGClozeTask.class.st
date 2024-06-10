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
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:00'
}
SLGClozeTask class >> newClozeWithQuestion: aQuestionString withCode: aCodeString withCloze: aClozeString withAnswer: anAnswerString [

	^ self new
			setQuestion: aQuestionString;
        		setCode: aCodeString;
			cloze: aClozeString;
			answer: anAnswerString;
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
