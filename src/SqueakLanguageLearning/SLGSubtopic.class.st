Class {
	#name : #SLGSubtopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:33'
}
SLGSubtopic >> isCompleted [

	lessons do: [ :each |
		(each isCompleted) ifFalse: [ ^false ] ].
	
	^ true

	
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
	#'squeak_changestamp' : 'EB 6/26/2024 14:12'
}
SLGSubtopic >> lessons: anObject [
	lessons := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:25'
}
SLGSubtopic >> listenToTaskCompleted [
	
	lessons do: [:each |
		each task when: #taskCompleted send: #onTaskCompleted to: self ]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:33'
}
SLGSubtopic >> onTaskCompleted [

	(self isCompleted)
		ifTrue: [ Transcript show: 'You have earned a badge for a subtopic ', self title; cr.
			self triggerEvent: #subtopicCompleted.
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
	#'squeak_changestamp' : 'EB 6/26/2024 14:12'
}
SLGSubtopic >> title: anObject [
	title := anObject
]
