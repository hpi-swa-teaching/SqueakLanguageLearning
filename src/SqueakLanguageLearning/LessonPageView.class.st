Class {
	#name : #LessonPageView,
	#superclass : #AbstractPage,
	#instVars : [
		'task'
	],
	#classInstVars : [
		'taskTypeDictionary'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 22:42'
}
LessonPageView class >> initializeTaskTypeDictionary [
	
	"key is a name of object class for the type of task"
	taskTypeDictionary := Dictionary new.
	
    	taskTypeDictionary at: 'DragAndDropTask' put: (Array with: SLGDragAndDropView with: #newWithTask:).
	taskTypeDictionary at: 'SLGClozeTask' put: (Array with: SLGClozeUI with:#newClozeUIwithTask:).
    	taskTypeDictionary at: 'SLGMultipleChoiceTask' put: (Array with: SLGMultipleChoiceUI with: #newMultipleChoiceUIwithTask:).
    	taskTypeDictionary at: 'SLGSingleChoiceTask' put: (Array with: SLGSingleChoiceUI with: #newSingleChoiceUIwithTask:).
    	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:10'
}
LessonPageView class >> newWithLesson: aLesson andController: aController [

	^self basicNew initializeWithLesson: aLesson andController: aController
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/31/2024 00:42'
}
LessonPageView class >> taskTypeDictionary [
	
	taskTypeDictionary isNil ifTrue: self initializeTaskTypeDictionary.
	^ taskTypeDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 18:46'
}
LessonPageView >> createViewForTask: aTask [

	| dict method targetClass methodName key parameters|
	dict := self getTaskTypeDictionary.
	key := (aTask  class name) asString.
	Transcript show: key.
	method := dict at: key.
	
	targetClass := method first.
	methodName := method second.
	parameters := Array new: 1.
	parameters at: 1 put: aTask.
	
	^targetClass perform: methodName withArguments: parameters.

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 16:39'
}
LessonPageView >> getTaskTypeDictionary [
	
	^self class taskTypeDictionary
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:50'
}
LessonPageView >> initializeWithLesson: aLesson andController: aController [
	
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
