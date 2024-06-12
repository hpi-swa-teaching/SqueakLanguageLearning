Class {
	#name : #SLGTask,
	#superclass : #Object,
	#instVars : [
		'id',
		'question',
		'correctAnswer'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
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
	#'squeak_changestamp' : 'SW 6/8/2024 17:41'
}
SLGTask >> calculateResult: anUserInput [

	| comparison percentage |
	
	Transcript show: 'No Error occured.'; cr.
	
	comparison := self findMatches: self correctAnswer with: anUserInput.
	percentage := self calculatePercentage: (comparison size) with: (self correctAnswer size).
	
	^ percentage

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
	#'squeak_changestamp' : 'SW 6/8/2024 14:24'
}
SLGTask >> correctAnswer: anObject [
	correctAnswer := anObject
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 14:33'
}
SLGTask >> findMatches: aReferenceArray with: anInputArray [

	^ (1 to: aReferenceArray size) select: [:index | (aReferenceArray at: index) = (anInputArray at: index)] thenCollect: [:index | aReferenceArray at: index].
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
	#'squeak_changestamp' : 'EB 6/12/2024 13:48'
}
SLGTask >> id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/12/2024 19:04'
}
SLGTask >> isCompleted [
	
	^((SLGUserProgress userData) completed includes: id)

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
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question: anObject [
	question := anObject
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:41'
}
SLGTask >> sendError [

	"Negative result shows, that something went wrong"
	Transcript show: 'Error occured.'; cr.
	
	^ -1
]

{
	#category : #verification,
	#'squeak_changestamp' : 'EB 6/12/2024 19:04'
}
SLGTask >> verifyAnswer: anUserInput [

	| output |
	
	Transcript show: 'isValid: ', (self isValid: anUserInput); cr.
	
	(self isValid: anUserInput)
		ifTrue: [
			output := self calculateResult: anUserInput.
			
			SLGUserProgress userData markTaskAsCompleted: (self id).
			"TODO check if you've earned a reward"
			Transcript show: SLGUserProgress userData getScore; cr. ]
		
		ifFalse: [output := self sendError].
		
	^ output
]
