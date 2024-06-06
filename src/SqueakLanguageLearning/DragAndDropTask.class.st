Class {
	#name : #DragAndDropTask,
	#superclass : #Task,
	#instVars : [
		'taskDescription',
		'correctAnswer'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 22:37'
}
DragAndDropTask class >> newWithTask: aTask [ 

	^self new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 22:10'
}
DragAndDropTask class >> task: aString correctAnswer: aCollection [

	^ self new initializeWithTask: aString andAnswers: aCollection
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:58'
}
DragAndDropTask >> correctAnswer [

	^ correctAnswer
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:57'
}
DragAndDropTask >> correctAnswer: anObject [
	correctAnswer := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/21/2024 22:42'
}
DragAndDropTask >> getShuffledOptions [

	^correctAnswer shuffled
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 14:04'
}
DragAndDropTask >> initializeWithTask: aString andAnswers: aCollection [

	taskDescription := aString.
	correctAnswer := aCollection
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:05'
}
DragAndDropTask >> isAnswerCorrect:anAnswer [ 

	^ anAnswer = correctAnswer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:58'
}
DragAndDropTask >> taskDescription [
	^ taskDescription
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:57'
}
DragAndDropTask >> taskDescription: anObject [
	taskDescription := anObject
]
