Class {
	#name : #SLGTask,
	#superclass : #Object,
	#instVars : [
		'question',
		'correctAnswer'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 14:32'
}
SLGTask >> calculatePercentage: aValue with: aTotal [

	| percentage |
	percentage := ((aValue / aTotal) * 100) rounded.
	
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
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 14:33'
}
SLGTask >> findMatches: aReferenceArray with: anInputArray [

	^ (1 to: aReferenceArray size) select: [:index | (aReferenceArray at: index) = (anInputArray at: index)] thenCollect: [:index | aReferenceArray at: index].
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
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 14:41'
}
SLGTask >> validate: anUserInput [

	| comparison percentage |
	
	comparison := self findMatches: self correctAnswer with: anUserInput.
	percentage := self calculatePercentage: (comparison size) with: (self correctAnswer size).
	
	^ percentage
]
