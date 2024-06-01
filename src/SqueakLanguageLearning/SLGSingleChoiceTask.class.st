Class {
	#name : #SLGSingleChoiceTask,
	#superclass : #SLGMultipleChoiceTask,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/1/2024 13:17'
}
SLGSingleChoiceTask class >> newSingleChoiceWithQuestion: aQuestionString withOptions: anOptionArray withAnswers: anAnswerArray [

	^ self new
			question: aQuestionString;
			answerOptions: anOptionArray;
			answers: anAnswerArray;
			yourself
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 6/1/2024 13:27'
}
SLGSingleChoiceTask >> initialize [

	super initialize
]
