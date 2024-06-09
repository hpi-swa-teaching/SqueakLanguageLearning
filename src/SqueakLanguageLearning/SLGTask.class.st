Class {
	#name : #SLGTask,
	#superclass : #Object,
	#instVars : [
		'question',
		'code'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/7/2024 16:07'
}
SLGTask >> code [
	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/7/2024 16:07'
}
SLGTask >> code: anObject [
	code := anObject
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/29/2024 16:08'
}
SLGTask >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question [
	^ question
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/1/2024 17:37'
}
SLGTask >> question: anObject [
	question := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:41'
}
SLGTask >> setCode: aCodeString [ 

        aCodeString ifNotEmpty: [ self code: (aCodeString copyReplaceAll: '\n' with: '', Character cr,'')]
    
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/9/2024 23:57'
}
SLGTask >> setQuestion: aQuestionString [ 

        aQuestionString ifNotEmpty: [ self question: aQuestionString ]
    
]
