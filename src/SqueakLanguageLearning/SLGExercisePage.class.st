Class {
	#name : #SLGExercisePage,
	#superclass : #SLGSubPage,
	#instVars : [
		'exercise'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:23'
}
SLGExercisePage >> exercise [
	^ exercise
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:23'
}
SLGExercisePage >> exercise: anObject [
	exercise := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/26/2024 14:22'
}
SLGExercisePage >> initialize [
	
	|multichoice|
	super initialize.
	"multiplechoice should take a subpage as owner morph and display the content based on subpage"
	"test multi choice question"
	multichoice := SLGMultipleChoice newMultipleChoiceWithDescription: 'Do we like Squeak?'  withQuestions: #('Yes' 'No' 'Maybe') withAnswers: #(true true false) onSubpage: self. 
	self exercise: multichoice.
	
]
