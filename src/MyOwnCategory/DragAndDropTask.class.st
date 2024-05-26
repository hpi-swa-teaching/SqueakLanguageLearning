Class {
	#name : #DragAndDropTask,
	#superclass : #Object,
	#instVars : [
		'taskDescription',
		'correctAnswer'
	],
	#category : #'MyOwnCategory-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 22:10'
}
DragAndDropTask class >> task: aString correctAnswer: aCollection [

	^ self new initializeWithTask: aString andAnswers: aCollection
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/22/2024 22:48'
}
DragAndDropTask >> getCorrectAnswer [

	^ correctAnswer
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/21/2024 22:42'
}
DragAndDropTask >> getShuffledOptions [

	^correctAnswer shuffled
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/22/2024 22:48'
}
DragAndDropTask >> getTaskDescription [
	^ taskDescription
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
