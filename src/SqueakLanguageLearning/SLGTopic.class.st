Class {
	#name : #SLGTopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:58'
}
SLGTopic class >> newWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:32'
}
SLGTopic class >> title: aTitle description: aDescription subtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
SLGTopic >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/13/2024 19:49'
}
SLGTopic >> initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

	title := aTitle.
	description := aDescription.
	subtopics := subtopicsList.
	
	subtopics do: [:each |
		each when: #subtopicCompleted send: #onSubtopicCompleted to: self ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 16:33'
}
SLGTopic >> isCompleted [

	subtopics do: [ :each |
		(each isCompleted) ifFalse: [ ^false. ] ].
	
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:29'
}
SLGTopic >> onSubtopicCompleted [

	(self isCompleted) ifTrue: [ Transcript show: 'You have earned a badge for a topic ', self title; cr.
			self triggerEvent: #topicCompleted.
			SLGUserProgress userData updateTopicScore. ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:08'
}
SLGTopic >> subtopics [
	^ subtopics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
SLGTopic >> title [
	^ title
]
