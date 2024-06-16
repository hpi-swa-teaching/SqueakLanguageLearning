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
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:12'
}
LessonPageView class >> taskTypeDictionary [
	
	taskTypeDictionary ifNil: [self initializeTaskTypeDictionary].
	^ taskTypeDictionary
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 00:09'
}
LessonPageView class >> taskViewExtent [

	"^ (self superclass pageWidth * 0.8) @ (self superclass pageHeight * 0.7)"
	^ 1200@800
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 13:21'
}
LessonPageView >> createViewForTask: aTask [

	| dict method targetClass methodName key parameters|
	dict := self getTaskTypeDictionary.
	key := (aTask  class name) asString.
	method := dict at: key ifAbsent: [].
	targetClass := method first.			"Class name e.g SLGDragAndDropView, SLGClozeView,.."
	methodName := method second.	"Constructor of the Class above"
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
	#'squeak_changestamp' : 'EB 6/16/2024 09:56'
}
LessonPageView >> initializeWithLesson: aLesson Subtopic: aSubtopic Topic: aTopic andController: aController [
	
	| taskView |
	super initializeWithController: aController.
	self addTitle: 'Lesson Title'. "TODO substitute with the one stored in DataAccessService"
	
	task := aLesson task.
	task ifNil: [ ^self. ].
	taskView := self createViewForTask: task.
		
	taskView 
		center: self body center.
	
	self body addMorph: taskView. 
	
	aLesson task when: #taskCompleted evaluate: 
		[ self updateScoreDisplay. 
		(aSubtopic isCompleted) ifTrue: [self updateSubtopicScoreDisplay.
			(aTopic isCompleted) ifTrue: [self updateTopicScoreDisplay]] ].
	
]
