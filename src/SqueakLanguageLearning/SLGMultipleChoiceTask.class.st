Class {
	#name : #SLGMultipleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 10:21'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
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
	#'squeak_changestamp' : 'SW 6/8/2024 14:27'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
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
