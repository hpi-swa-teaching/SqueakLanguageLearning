Class {
	#name : #SLGSingleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:01'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			setQuestion: aQuestionString;
        		setCode: aCodeString;
			answerOptions: anOptionArray;
			answers: anAnswerArray;
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
