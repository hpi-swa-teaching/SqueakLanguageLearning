Class {
	#name : #SubtopicPageView,
	#superclass : #AbstractNavigationPage,
	#instVars : [
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 10:41'
}
SubtopicPageView class >> newWithSubtopic: aSubtopic andController: aController [
	
	^super basicNew initializeWithSubtopic: aSubtopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:43'
}
SubtopicPageView >> buttonClicked: buttonIndex [

	| lesson |
	lesson := lessons at: buttonIndex.
	controller handleLessonSelected: lesson.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:44'
}
SubtopicPageView >> initializeWithSubtopic: aSubtopic andController: aController [
	
	| lessonsTitles lessonTitle |
	super initializeWithController: aController.
	self addTitle: aSubtopic title.
	
	lessons := aSubtopic lessons.
	lessonsTitles := Array new: (lessons size).
	lessons withIndexDo: [:lesson :index |
		lessonTitle := 'Lesson title', index asString.
		lessonsTitles at: index put: lessonTitle.
        ].
	
	self addButtonsWithTitles: lessonsTitles.
	self addBackButton.
	
	
	
]
