"
This class handles all logic for single choice.
"
Class {
	#name : #SLGSingleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:30'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:11'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
			code: aCodeString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
	
]
