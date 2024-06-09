Class {
	#name : #SLGDragAndDropTask,
	#superclass : #SLGTask,
	#instVars : [
		'correctAnswer'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:00'
}
SLGDragAndDropTask class >> newWithQuestion: aQuestionString withCode: aCodeString withCorrectAnswer: anArray [

	^ self new
		setQuestion: aQuestionString;
        	setCode: aCodeString;
        	setCode: aCodeString;
		correctAnswer: anArray;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:30'
}
SLGDragAndDropTask class >> newWithQuestion: aString withCorrectAnswer: anArray [

	^ self new
		question: aString;
		correctAnswer: anArray;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:58'
}
SLGDragAndDropTask >> correctAnswer [

	^ correctAnswer
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 19:57'
}
SLGDragAndDropTask >> correctAnswer: anObject [
	correctAnswer := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:35'
}
SLGDragAndDropTask >> getShuffledOptions [

	^ self correctAnswer shuffled
	

]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/6/2024 16:50'
}
SLGDragAndDropTask >> validate: anAnswer [ 

	^ anAnswer = self correctAnswer
]
