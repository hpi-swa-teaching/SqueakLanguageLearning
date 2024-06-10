Class {
	#name : #SLGMultipleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/9/2024 23:58'
}
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withCode: aCodeString withOptions: anOptionArray withAnswers: anAnswerArray [

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
SLGMultipleChoiceTask class >> newMultipleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
			answerOptions: anOptionArray;
			correctAnswer: anAnswerArray;
			yourself
	
]
