Class {
	#name : #LessonPage,
	#superclass : #Page,
	#classInstVars : [
		'taskTypeDictionary'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:17'
}
LessonPage class >> initializeTaskTypeDictionary [
	
	"key is a name of object class for the type of task"
	taskTypeDictionary := Dictionary new.
	
    	taskTypeDictionary at: 'DragAndDropTask' put: (Array with: DragAndDropMorph with: #newWithTask:).
    	taskTypeDictionary at: 'MultipleChoiceTask' put: (Array with: MultipleChoiceMorph with: #newWithTask:).
    	taskTypeDictionary at: 'TrueFalseTask' put: #method3.
    	taskTypeDictionary at: 'FillGapsTask' put: #method4.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:10'
}
LessonPage class >> newWithLesson: aLesson [

	^self new initializeWithLesson: aLesson
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/31/2024 00:42'
}
LessonPage class >> taskTypeDictionary [
	
	taskTypeDictionary isNil ifTrue: self initializeTaskTypeDictionary.
	^ taskTypeDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:17'
}
LessonPage >> createViewForTask: aTask [

	| dict method targetClass methodName key parameters|
	dict := self getTaskTypeDictionary.
	key := (aTask  class name) asString.
	method := dict at: key. "ifAbsent: [ ^Transcript show: 'Key not found'; cr ]."
	
	targetClass := method first.
	methodName := method second.
	parameters := Array new: 1.
	parameters at: 1 put: aTask.
	
	^targetClass perform: methodName withArguments: parameters.

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 00:43'
}
LessonPage >> getTaskTypeDictionary [
	
	^LessonPage taskTypeDictionary
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:16'
}
LessonPage >> initializeWithLesson: aLesson [
 	
	| task taskView |
	super initialize.
	
	self addBackButton;
		addTitle: 'LessonTitle'.
	
	task := aLesson task.
	taskView := self createViewForTask: task.
	self addMorph: taskView. 
	

]
