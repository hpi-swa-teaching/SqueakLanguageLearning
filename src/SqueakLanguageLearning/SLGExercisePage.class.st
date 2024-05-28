Class {
	#name : #SLGExercisePage,
	#superclass : #SLGSubPage,
	#instVars : [
		'exercise'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 10:17'
}
SLGExercisePage >> addMultipleChoicewithDescription: aString withQuestions: aList1 withAnswers: aList2 [

"multiplechoice should take a subpage as owner morph and display the content based on subpage"
	"test multi choice question"
	|multichoice|
	multichoice := SLGMultipleChoice newMultipleChoiceWithDescription: aString  withQuestions: aList1 withAnswers: aList2 withSingleChoice: false on: self. 
	self exercise: multichoice.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 10:20'
}
SLGExercisePage >> addSingleChoicewithDescription: aString withQuestions: aList1 withAnswers: aList2 [

"multiplechoice should take a subpage as owner morph and display the content based on subpage"
	"test multi choice question"
	|singlechoice|
	singlechoice := SLGMultipleChoice newMultipleChoiceWithDescription: aString  withQuestions: aList1 withAnswers: aList2 withSingleChoice: true on: self. 
	self exercise: singlechoice.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 10:25'
}
SLGExercisePage >> demoMultiChoice [

	self addMultipleChoicewithDescription: 'Do we like Squeak? (Multiple answers allowed.)' withQuestions:  #('Yes' 'No' 'Maybe')  withAnswers: #(true true false).

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 10:26'
}
SLGExercisePage >> demoSingleChoice [

	self addSingleChoicewithDescription: 'Do we like Squeak? (Just say yes.)' withQuestions:  #('Yes' 'No' 'Maybe')  withAnswers: #(true false false).

]

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
	#'squeak_changestamp' : 'xiaoshi 5/28/2024 10:23'
}
SLGExercisePage >> initialize [
	
	super initialize.
]
