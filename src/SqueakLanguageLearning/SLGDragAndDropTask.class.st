Class {
	#name : #SLGDragAndDropTask,
	#superclass : #SLGTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 20:59'
}
SLGDragAndDropTask class >> newWithQuestion: aQuestionString withCode: aCodeString withCorrectAnswer: anArray [

	^ self new
		question: aQuestionString;
		code: aCodeString;
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
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/6/2024 15:35'
}
SLGDragAndDropTask >> getShuffledOptions [

	^ self correctAnswer shuffled
	

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:49'
}
SLGDragAndDropTask >> isValid: anArray [
	
	^ true
]
