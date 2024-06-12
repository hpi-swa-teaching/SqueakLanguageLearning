Class {
	#name : #SLGSingleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 19:45'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
			code: aCodeString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
	
]

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

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/8/2024 14:27'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/12/2024 22:11'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray withID: anID [

	^ self new
			id: anID;
			question: aQuestionString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
]
