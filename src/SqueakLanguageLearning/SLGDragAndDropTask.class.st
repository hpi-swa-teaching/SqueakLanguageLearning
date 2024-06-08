Class {
	#name : #SLGDragAndDropTask,
	#superclass : #SLGTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

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
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/6/2024 15:35'
}
SLGDragAndDropTask >> getShuffledOptions [

	^ self correctAnswer shuffled
	

]
