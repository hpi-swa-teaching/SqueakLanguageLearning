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
	#'squeak_changestamp' : 'yegi 7/10/2024 16:14'
}
SLGLessonPageView class >> newWithLessons: aLessons withSubtopic: aSubtopic withTopic: aTopic withController: aController [ 

	^ self new 
		controller: aController;
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
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:09'
}
SLGLessonPageView >> carousel: anObject [
	carousel := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 17:54'
}
SLGLessonPageView >> codeBlockOnClick [
	
	self carousel canSwitch
		ifFalse: [self controller routerController navigateBack].
	self carousel next.
	(self lessons at: self carousel currentIndex + 1) task
		when: #taskCompleted
		evaluate: [self updateScoreDisplay.
			self subtopic isCompleted
				ifTrue: [self updateSubtopicScoreDisplay.
					self topic isCompleted
						ifTrue: [self updateTopicScoreDisplay]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 17:34'
}
SLGLessonPageView >> constructView [

	| taskViews nextButton col |
	self addTitle: 'Lesson Title';
		currentIndex: 0.
	taskViews := self lessons
				collect: [:lesson | 
					| task taskView |
					task := lesson task.
					task
						ifNil: [^ self].
					taskView := self createViewForTask: task.
					taskView].
	self
		carousel: (SLGCarouselGen newCarouselWithMorphs: taskViews).
	self carousel center: self body center.
	nextButton := self createNextButton.
	(self lessons at: self carousel currentIndex + 1) task
		when: #taskCompleted
		evaluate: [self updateScoreDisplay.
			self subtopic isCompleted
				ifTrue: [self updateSubtopicScoreDisplay.
					self topic isCompleted
						ifTrue: [self updateTopicScoreDisplay]]].
	col := SLGLayout columnWithMorphs: {self carousel. nextButton} withGap: self class topicGapHeight.
	col center: self body center.
	
	self body addMorph: col
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 17:56'
}
SLGLessonPageView >> createNextButton [

	^ SLGNavigationButtonGen new label: 'Next';
		 height: self class nextButtonHeight;
		 width: self class smallButtonWidth;
		 cornerRadius: self class lessonCornerRadius;
		 color: SLGTaskView paperBasic;
		
		onClickWithBlock: [self codeBlockOnClick]
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 15:27'
}
SLGLessonPageView >> createViewForTask: aTask [ 

	| taskTypeDict method targetClass methodName key parameters |
	taskTypeDict := self getTaskTypeDictionary.
	key := aTask class name asString.
	method := taskTypeDict
				at: key
				ifAbsent: [].
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
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:06'
}
SLGLessonPageView >> currentIndex: anObject [
	currentIndex := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 15:02'
}
SLGLessonPageView >> getTaskTypeDictionary [
	
	^ self class taskTypeDictionary
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 7/10/2024 16:18'
}
SLGLessonPageView >> initialize [
	
	"| taskViews nextButton col |"
	super initialize.
	
	"self addTitle: 'Lesson Title';
		currentIndex: 0.
	taskViews := self lessons
				collect: [:lesson | 
					| task taskView |
					task := lesson task.
					task
						ifNil: [^ self].
					taskView := self createViewForTask: task.
					taskView].
	self
		carousel: (SLGCarouselGen newCarouselWithMorphs: taskViews).
	self carousel center: self body center."
	
	"nextButton := SLGNavigationButtonGen new label: 'Next';
				 height: self class nextButtonHeight;
				 width: self class smallButtonWidth;
				 cornerRadius: self class lessonCornerRadius;
				 color: SLGTaskView paperBasic;
				
				onClickWithBlock: [self carousel canSwitch
						ifFalse: [self controller routerController navigateBack].
					self carousel next.
					(self lessons at: self carousel currentIndex + 1) task
						when: #taskCompleted
						evaluate: [self updateScoreDisplay.
							self subtopic isCompleted
								ifTrue: [self updateSubtopicScoreDisplay.
									self topic isCompleted
										ifTrue: [self updateTopicScoreDisplay]]]];
				 yourself."
				
"		nextButton := self createNextButton.
	(self lessons at: self carousel currentIndex + 1) task
		when: #taskCompleted
		evaluate: [self updateScoreDisplay.
			self subtopic isCompleted
				ifTrue: [self updateSubtopicScoreDisplay.
					self topic isCompleted
						ifTrue: [self updateTopicScoreDisplay]]].
	col := SLGLayout columnWithMorphs: {self carousel. nextButton} withGap: self class topicGapHeight.
	col center: self body center.
	self body addMorph: col"
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
	#'squeak_changestamp' : 'yegi 7/10/2024 14:09'
}
SLGLessonPageView >> lessons: anObject [
	lessons := anObject
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
	#'squeak_changestamp' : 'yegi 7/10/2024 14:08'
}
SLGLessonPageView >> subtopic: anObject [
	subtopic := anObject
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
	#'squeak_changestamp' : 'yegi 7/10/2024 14:08'
}
SLGLessonPageView >> topic: anObject [
	topic := anObject
]
