Class {
	#name : #SLGDragAndDropTask,
	#superclass : #SLGTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 22:13'
}
SLGDragAndDropTask class >> newWithQuestion: aQuestionString withCode: aCodeString withCorrectAnswer: anArray withID: anID [

	^ self new
		id: anID;
		question: aQuestionString;
		code: aCodeString;
		correctAnswer: anArray;
		yourself
		

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 19:06'
}
SLGDragAndDropTask class >> newWithQuestion: aString withCorrectAnswer: anArray withID: anID [

	^ self new
		id: anID;
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
