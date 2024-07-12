"
This class handles all logic for multiple choice.
"
Class {
	#name : #SLGMultipleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:29'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:12'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
			code: aCodeString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
	
]
