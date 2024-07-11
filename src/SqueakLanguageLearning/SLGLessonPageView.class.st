"
This class can be used to create a lesson page(the page with an exercise the user will answer questions).
"
Class {
	#name : #SLGLessonPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'task',
		'nextExerciseRoute',
		'carousel',
		'currentIndex',
		'topic',
		'subtopic',
		'lessons'
	],
	#classInstVars : [
		'taskTypeDictionary'
	],
	#category : #'SqueakLanguageLearning-Pages',
	#'squeak_changestamp' : 'yegi 7/9/2024 10:43'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'yegi 7/10/2024 13:36'
}
SLGLessonPageView class >> initializeTaskTypeDictionary [

	self taskTypeDictionary: Dictionary new.
	self taskTypeDictionary
		at: 'SLGDragAndDropTask'
		put: (Array with: SLGDragAndDropView with: #newWithTask:).
	self taskTypeDictionary
		at: 'SLGClozeTask'
		put: (Array with: SLGClozeView with: #newClozeUIwithTask:).
	self taskTypeDictionary
		at: 'SLGMultipleChoiceTask'
		put: (Array with: SLGMultipleChoiceView with: #newMultipleChoiceUIwithTask:).
	self taskTypeDictionary
		at: 'SLGSingleChoiceTask'
		put: (Array with: SLGSingleChoiceView with: #newSingleChoiceUIwithTask:)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 7/11/2024 16:24'
}
SLGLessonPageView class >> newWithLessons: aLessons withSubtopic: aSubtopic withTopic: aTopic withController: aController [ 

	^ (self newDefaultWithController: aController)
		lessons: aLessons;
		subtopic: aSubtopic;
		topic: aTopic;
		constructView;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 13:35'
}
SLGLessonPageView class >> taskTypeDictionary [

	taskTypeDictionary
		ifNil: [self initializeTaskTypeDictionary].
	^ taskTypeDictionary
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
	#'squeak_changestamp' : 'yegi 7/11/2024 19:37'
}
SLGLessonPageView >> carousel: anArrayOfMorphs [
	carousel := anArrayOfMorphs
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:12'
}
SLGLessonPageView >> constructView [

	| taskViews nextButton col |
	self addTitle: 'Lesson Title';
		currentIndex: 0.
	taskViews := self taskViewSetup.
	self carousel: (SLGCarouselGen newCarouselWithMorphs: taskViews).
	self carousel center: self body center.
	nextButton := self createNextButton.
	self updateScoreDisplayOnCompletion.
	col := SLGLayout columnWithMorphs: {self carousel. nextButton} withGap: (self class topicGapHeight) px.
	col center: self body center.
	self body addMorph: col
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:10'
}
SLGLessonPageView >> createNextButton [

	^ SLGNavigationButtonGen new label: 'Next';
		 height: (self class nextButtonHeight) px;
		 width:(self class smallButtonWidth) px;
		 cornerRadius: self class cornerRadius;
		 color: SLGTaskView paperBasic;
		 onClickWithBlock: [self navigateTroughCarousel];
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:18'
}
SLGLessonPageView >> createViewForTask: aTask [ 

	| taskTypeDictionary method targetClass methodName key parameters |
	taskTypeDictionary := self getTaskTypeDictionary.
	key := aTask class name asString.
	method := taskTypeDictionary at: key ifAbsent: [].
	targetClass := method first.
	methodName := method second.
	parameters := Array new: 1.
	parameters at: 1 put: aTask.

	^ targetClass perform: methodName withArguments: parameters
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
	#'squeak_changestamp' : 'yegi 7/11/2024 19:38'
}
SLGLessonPageView >> currentIndex: aNumber [
	currentIndex := aNumber
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 15:02'
}
SLGLessonPageView >> getTaskTypeDictionary [
	
	^ self class taskTypeDictionary
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 14:09'
}
SLGLessonPageView >> lessons [
	^ lessons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 19:19'
}
SLGLessonPageView >> lessons: aLessonsCollection [
	lessons := aLessonsCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:12'
}
SLGLessonPageView >> navigateTroughCarousel [
	
	self carousel canSwitch
		ifFalse: [self controller routerController navigateBack].
	self carousel next.
	self updateScoreDisplayOnCompletion
]

{
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/10/2024 13:34'
}
SLGLessonPageView >> refresh [

	super refresh.
	
	self carousel currentIndex: self currentIndex.
	self carousel update
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 14:08'
}
SLGLessonPageView >> subtopic [
	^ subtopic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 19:27'
}
SLGLessonPageView >> subtopic: aSubtopicsCollection [
	subtopic := aSubtopicsCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:16'
}
SLGLessonPageView >> taskViewSetup [

	^ self lessons
		collect: [:lesson | 
			| task taskView |
			task := lesson task.
			task ifNil: [^ self].
			taskView := self createViewForTask: task.
			taskView]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 14:08'
}
SLGLessonPageView >> topic [
	^ topic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 19:39'
}
SLGLessonPageView >> topic: aTopicsList [
	topic := aTopicsList
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:50'
}
SLGLessonPageView >> updateScoreDisplayOnCompletion [
	
	| currentLesson currentTask subtopicCompleted topicCompleted |
    	currentLesson := self lessons at: self carousel currentIndex + 1.
    	currentTask := currentLesson task.

    	currentTask when: #taskCompleted evaluate: [
		self updateScoreDisplay.
        	subtopicCompleted := self subtopic isCompleted.
        	topicCompleted := subtopicCompleted and: [ self topic isCompleted ].

       topicCompleted ifTrue: [
            self updateSubtopicScoreDisplay.
            self updateTopicScoreDisplay ]
	]
]
