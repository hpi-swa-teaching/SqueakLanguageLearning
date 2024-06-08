Class {
	#name : #SLGSingleChoiceTask,
	#superclass : #SLGBaseChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

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
