"
Represents a structure that consists of a title and lessons; able to observe the completion of tasks within its own lessons.
"
Class {
	#name : #SLGSubtopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Data',
	#'squeak_changestamp' : 'EB 6/26/2024 15:38'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/26/2024 14:26'
}
SLGSubtopic class >> newWithTitle: aTitle andLessons: lessons [
	
	^ self new
		title: aTitle;
		lessons: lessons;
		listenToTaskCompleted;
		yourself
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/9/2024 14:36'
}
SLGSubtopic >> isCompleted [
	
	^ (self lessons detect: [ :each | 
				each isCompleted not ] ifNone: [ nil ]) isNil

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:10'
}
SLGSubtopic >> lessons [
	^ lessons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/26/2024 15:48'
}
SLGSubtopic >> lessons: lessonsCollection [
	lessons := lessonsCollection
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'EB 7/9/2024 14:16'
}
SLGSubtopic >> listenToTaskCompleted [
	
	self lessons do: [:each |
		each task when: #taskCompleted send: #onTaskCompleted to: self ]
	
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'SW 7/11/2024 17:55'
}
SLGSubtopic >> onTaskCompleted [

	(self isCompleted)
		ifTrue: [self triggerEvent: #subtopicCompleted.
			SLGUserProgress userData updateSubtopicScore  ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:10'
}
SLGSubtopic >> title [
	^ title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/26/2024 15:48'
}
SLGSubtopic >> title: aTitle [
	title := aTitle
]
