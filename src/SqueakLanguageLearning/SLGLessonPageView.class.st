Class {
	#name : #SLGLessonPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'task',
		'nextExerciseRoute',
		'carousel',
		'currentIndex'
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
SLGLessonPageView class >> initializeTaskTypeDictionary [
	
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
SLGLessonPageView class >> taskTypeDictionary [
	
	taskTypeDictionary ifNil: [self initializeTaskTypeDictionary].
	^ taskTypeDictionary
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 00:09'
}
SLGLessonPageView class >> taskViewExtent [

	"^ (self superclass pageWidth * 0.8) @ (self superclass pageHeight * 0.7)"
	^ 1200@800
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:09'
}
SLGLessonPageView >> carousel [
	^ carousel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:09'
}
SLGLessonPageView >> carousel: anObject [
	carousel := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 13:21'
}
SLGLessonPageView >> createViewForTask: aTask [

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
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:06'
}
SLGLessonPageView >> currentIndex [
	^ currentIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:06'
}
SLGLessonPageView >> currentIndex: anObject [
	currentIndex := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 16:39'
}
SLGLessonPageView >> getTaskTypeDictionary [
	
	^self class taskTypeDictionary
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 01:44'
}
SLGLessonPageView >> initializeWithLessons: aLessons Subtopic: aSubtopic Topic: aTopic andController: aController [
	| taskViews nextButton col |
	super initializeWithController: aController.
	self addTitle: 'Lesson Title'. "TODO substitute with the one stored in DataAccessService"
	self currentIndex: 0.
	taskViews := aLessons collect: [:lesson |
		| task taskView |
		task := lesson task.
		task ifNil: [ ^self. ].
		taskView := self createViewForTask: task.
		taskView
	].

	self carousel: (SLGCarouselGen new
		initializeWithMorphs: taskViews).
		
	self carousel center: self body center.
	
	nextButton := SLGNavigationButtonGen new
			label: 'Next';
			height: self class buttonHeight * 0.8;
			width: self class smallButtonWidth;
			cornerRadius: 10px;
			color: SLGTaskView paperBasic;
			 onClickWithBlock: [
				
				self carousel canSwitch ifFalse: [
					self controller routerController navigateBack.
				].
				self carousel next.
				
				(aLessons at: self carousel currentIndex +1) task when: #taskCompleted evaluate: 
		[ self updateScoreDisplay. 
		(aSubtopic isCompleted) ifTrue: [self updateSubtopicScoreDisplay.
			(aTopic isCompleted) ifTrue: [self updateTopicScoreDisplay]] ].
			].
		
	(aLessons at: self carousel currentIndex +1) task when: #taskCompleted evaluate: 
		[ self updateScoreDisplay. 
		(aSubtopic isCompleted) ifTrue: [self updateSubtopicScoreDisplay.
			(aTopic isCompleted) ifTrue: [self updateTopicScoreDisplay]] ].
		
	col := SLGLayout columnWithMorphs: {self carousel.nextButton} withGap: 10.
	
	col center: self body center.
	
	self body addMorph: col.
	
	"task := aLessons task.
	task ifNil: [ ^self. ].
	taskView := self createViewForTask: task.
	
	view := SLGCarouselGen new
		initializeWithMorphs: {taskView.Morph new};
		currentIndex: anInt.
		
	view center: self body center.
	
	nextButton := SLGNavigationButtonGen new
			label: 'Next';
			width: self class buttonWidth;
			 onClickWithBlock: [
				view next.
			].
		
	 col := SLGLayout columnWithMorphs: {view.nextButton} withGap: 10.
	
	col center: self body center.
	
	self body addMorph: col. "
	
	"nextButton := SLGNavigationButtonGen new
			label: 'Next';
			width: self class buttonWidth;
			 onClickWithBlock: [
				self controller routerController navigateToWithoutHistory: self nextExerciseRoute withCurrentPage: self.
			].
	
	view := SLGLayout columnWithMorphs: {taskView.nextButton} withGap: 10.
		
	view center: self body center.
	
	self body addMorph: view. 
	
	aLesson task when: #taskCompleted evaluate: 
		[ self updateScoreDisplay. 
		(aSubtopic isCompleted) ifTrue: [self updateSubtopicScoreDisplay.
			(aTopic isCompleted) ifTrue: [self updateTopicScoreDisplay]] ]."
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 18:31'
}
SLGLessonPageView >> nextExerciseRoute [
	^ nextExerciseRoute
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 18:31'
}
SLGLessonPageView >> nextExerciseRoute: anObject [
	nextExerciseRoute := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:35'
}
SLGLessonPageView >> refresh [
	super refresh.
	self carousel currentIndex: self currentIndex.
	self carousel update.
]
