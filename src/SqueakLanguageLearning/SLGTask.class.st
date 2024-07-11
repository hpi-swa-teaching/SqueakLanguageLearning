"
This class is an abstraction for all different task types in SqueakLanguageLearning.
"
Class {
	#name : #SLGTask,
	#superclass : #Object,
	#instVars : [
		'question',
		'correctAnswer',
		'code',
		'id'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:26'
}

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 14:32'
}
SLGTask >> calculatePercentage: aValue with: aTotal [

	| percentage |
	percentage := ((aValue / aTotal) * 100) rounded.
	
	^ percentage

	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 14:56'
}
SLGTask >> calculateResult: anUserInput [

	| comparison percentage |
	
	comparison := self findMatches: self correctAnswer with: anUserInput.
	percentage := self calculatePercentage: (comparison size) with: (self correctAnswer size).
	
	^ percentage

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/7/2024 16:07'
}
SLGTask >> code [
	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:56'
}
SLGTask >> code: aCodeString [ 

        aCodeString ifNotEmpty: [code := aCodeString]
    
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/8/2024 14:24'
}
SLGTask >> correctAnswer [
	^ correctAnswer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:56'
}
SLGTask >> correctAnswer: anObject [
	correctAnswer := anObject
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 14:56'
}
SLGTask >> findMatches: aReferenceArray with: anInputArray [

	^ (1 to: aReferenceArray size) select: [:index | 
		(aReferenceArray at: index) = (anInputArray at: index)] thenCollect: [:index | aReferenceArray at: index]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/12/2024 13:48'
}
SLGTask >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:57'
}
SLGTask >> id: aString [
	id := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:57'
}
SLGTask >> isCompleted [
	
	^ ((SLGUserProgress userData) completed includes: self id)

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 16:47'
}
SLGTask >> isValid: anUserInput [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question [
	^ question
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:57'
}
SLGTask >> question: aQuestionString [ 

        aQuestionString ifNotEmpty: [question := aQuestionString]
    
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 14:58'
}
SLGTask >> sendError [

	"Negative result shows, that something went wrong"
	
	^ -1
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 14:58'
}
SLGTask >> verifyAnswer: anUserInput [

	| output |
	
	(self isValid: anUserInput)
		ifTrue: [
			output := self calculateResult: anUserInput. ]
		
		ifFalse: [output := self sendError].
		
	^ output
]
