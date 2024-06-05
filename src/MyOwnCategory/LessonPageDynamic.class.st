Class {
	#name : #LessonPageDynamic,
	#superclass : #PageDynamic,
	#instVars : [
		'task'
	],
	#classInstVars : [
		'taskTypeDictionary'
	],
	#category : #'MyOwnCategory-DynamicPages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:17'
}
LessonPageDynamic class >> initializeTaskTypeDictionary [
	
	"key is a name of object class for the type of task"
	taskTypeDictionary := Dictionary new.
	
    	taskTypeDictionary at: 'DragAndDropTask' put: (Array with: DragAndDropMorph with: #newWithTask:).
    	taskTypeDictionary at: 'MultipleChoiceTask' put: (Array with: MultipleChoiceMorph with: #newWithTask:).
    	taskTypeDictionary at: 'TrueFalseTask' put: #method3.
    	taskTypeDictionary at: 'FillGapsTask' put: #method4.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:10'
}
LessonPageDynamic class >> newWithLesson: aLesson andController: aController [

	^self basicNew initializeWithLesson: aLesson andController: aController
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/31/2024 00:42'
}
LessonPageDynamic class >> taskTypeDictionary [
	
	taskTypeDictionary isNil ifTrue: self initializeTaskTypeDictionary.
	^ taskTypeDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/31/2024 01:17'
}
LessonPageDynamic >> createViewForTask: aTask [

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
LessonPageDynamic >> getTaskTypeDictionary [
	
	^LessonPage taskTypeDictionary
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:50'
}
LessonPageDynamic >> initializeWithLesson: aLesson andController: aController [
	
	| tasks taskView |
	super initializeWithController: aController.
	self addTitle: 'Lesson Title'. "TODO substitute with the one stored in DataAccessService"
	"self addDescriptionTo: aLesson."
	
	task := aLesson task.
	tasks := Array new: 1.
	tasks withIndexDo: [:taskIndex :index |
		taskView := self createViewForTask: task.
		self addMorph: taskView. 
		tasks at: index put: 'Task Title'. "TODO substitute with the one stored in DataAccessService"
        ].
	
	self addBackButton.	
	
]
