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
	#'squeak_changestamp' : 'SW 6/6/2024 15:28'
}
LessonPageView class >> initializeTaskTypeDictionary [
	
	"key is a name of object class for the type of task"
	taskTypeDictionary := Dictionary new.
	
    	taskTypeDictionary at: 'SLGDragAndDropTask' put: (Array with: SLGDragAndDropView with: #newWithTask:).
	taskTypeDictionary at: 'SLGClozeTask' put: (Array with: SLGClozeView with:#newClozeUIwithTask:).
    	taskTypeDictionary at: 'SLGMultipleChoiceTask' put: (Array with: SLGMultipleChoiceView with: #newMultipleChoiceUIwithTask:).
    	taskTypeDictionary at: 'SLGSingleChoiceTask' put: (Array with: SLGSingleChoiceView with: #newSingleChoiceUIwithTask:).
    	
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
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:12'
}
LessonPageView class >> taskTypeDictionary [
	
	taskTypeDictionary ifNil: [self initializeTaskTypeDictionary].
	^ taskTypeDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:32'
}
LessonPageView >> createViewForTask: aTask [

	| dict method targetClass methodName key parameters|
	dict := self getTaskTypeDictionary.
	key := (aTask  class name) asString.
	method := dict at: key ifAbsent: [].
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
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:23'
}
LessonPageView >> initializeWithLesson: aLesson andController: aController [
	
	| taskView |
	super initializeWithController: aController.
	self addTitle: 'Lesson Title'. "TODO substitute with the one stored in DataAccessService"
	"self addDescriptionTo: aLesson."
	
	task := aLesson task.
	task ifNil: [
		^self.	
	].
	taskView := self createViewForTask: task.
	self body addMorph: taskView. 
	"tasks at: 1 put: 'Task Title'." "TODO substitute with the one stored in DataAccessService"
	
]
