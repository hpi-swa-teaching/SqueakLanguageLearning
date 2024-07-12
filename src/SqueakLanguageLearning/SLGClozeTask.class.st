"
This class handles all logic for a cloze (text with gaps).
"
Class {
	#name : #SLGClozeTask,
	#superclass : #SLGTask,
	#instVars : [
		'cloze'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:30'
}

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
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/12/2024 08:40'
}
SLGClozeTask class >> oneHundredPercent [
	
	^ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/12/2024 08:42'
}
SLGClozeTask class >> zeroPercent [
	
	^ 0
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/12/2024 08:42'
}
SLGClozeTask >> calculateResult: anUserInput [

	| modifiedInput modifiedAnswer output |
	modifiedInput := self removeSpacesAndLowercase: anUserInput.
	modifiedAnswer := (self removeSpacesAndLowercase: self correctAnswer).

	modifiedInput = modifiedAnswer
		ifTrue: [output := self class oneHundredPercent]
		ifFalse: [output := self class zeroPercent].
		
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
	#'squeak_changestamp' : 'SW 7/11/2024 16:46'
}
SLGClozeTask >> customizeInputAndAnswers: anUserInput [

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
	#'squeak_changestamp' : 'SW 7/11/2024 14:03'
}
SLGClozeTask >> removeSpacesAndLowercase: aString [

	^ (aString select: [:char | char isSeparator not]) asLowercase

]
