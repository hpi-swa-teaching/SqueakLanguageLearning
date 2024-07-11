"
This class handles all logic for drag and drop.
"
Class {
	#name : #SLGDragAndDropTask,
	#superclass : #SLGTask,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:30'
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
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/6/2024 15:35'
}
SLGDragAndDropTask >> getShuffledOptions [

	^ self correctAnswer shuffled
	

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/16/2024 12:47'
}
SLGDragAndDropTask >> isValid: anArray [
	
	^ self correctAnswer size = anArray size
]
