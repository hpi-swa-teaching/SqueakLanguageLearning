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
	#'squeak_changestamp' : 'EB 6/14/2024 18:35'
}
SLGSubtopic class >> newWithTitle: aTitle andLessons: lessonsList [

	^ self basicNew initializeWithTitle: aTitle andLessons: lessonsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:29'
}
SLGSubtopic class >> title: aTitle lessons: lessonsList [

	^ self new initializeWithTitle: aTitle andLessons: lessonsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 18:35'
}
SLGSubtopic >> initializeWithTitle: aTitle andLessons: lessonsList [

	title := aTitle.
	lessons := lessonsList.
	
	lessons do: [:each |
		each task when: #taskCompleted send: #onTaskCompleted to: self ]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 16:32'
}
SLGSubtopic >> isCompleted [

	lessons do: [ :each |
		(each isCompleted) ifFalse: [ ^false. ] ].
	
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:28'
}
SLGSubtopic >> onTaskCompleted [

	"Give a badge"
	(self isCompleted)
		ifTrue: [ Transcript show: 'You have earned a badge for a subtopic ', self title; cr.
			self triggerEvent: #subtopicCompleted.
			SLGUserProgress userData updateSubtopicScore.  ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:10'
}
SLGSubtopic >> title [
	^ title
]
