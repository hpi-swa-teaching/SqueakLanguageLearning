"
This class is the logic of multiple choice task template.
"
Class {
	#name : #SLGMultipleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 19:02'
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

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:12'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
	
]
