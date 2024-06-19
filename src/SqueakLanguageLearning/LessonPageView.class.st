Class {
	#name : #LessonPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'task',
		'nextExerciseRoute',
		'carousel',
		'currentIndex'
	],
	#category : 'SqueakLanguageLearning-Pages'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:09'
}
LessonPageView >> carousel [
	^ carousel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:09'
}
LessonPageView >> carousel: anObject [
	carousel := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:06'
}
LessonPageView >> currentIndex [
	^ currentIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 00:06'
}
LessonPageView >> currentIndex: anObject [
	currentIndex := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:52'
}
LessonPageView >> initializeWithLessons: aLessons Subtopic: aSubtopic Topic: aTopic andController: aController [
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
			width: self class buttonWidth;
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
LessonPageView >> nextExerciseRoute [
	^ nextExerciseRoute
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/18/2024 18:31'
}
LessonPageView >> nextExerciseRoute: anObject [
	nextExerciseRoute := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/19/2024 10:35'
}
LessonPageView >> refresh [
	super refresh.
	self carousel currentIndex: self currentIndex.
	self carousel update.
]
