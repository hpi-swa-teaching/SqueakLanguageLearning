"
Represents a structure that consists of a title, description, and subtopics; able to observe the completion of tasks within its own subtopics.
"
Class {
	#name : #SLGTopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Data',
	#'squeak_changestamp' : 'EB 6/26/2024 15:37'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:27'
}
SLGTopic class >> newWithTitle: aTitle Description: aDescription andSubtopics: subtopics [
	
	^self new 
		title: aTitle;
		description: aDescription;
		subtopics: subtopics;
		listenToSubtopicCompleted;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
SLGTopic >> description [
	^ description
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/26/2024 15:47'
}
SLGTopic >> description: aDescription [
	description := aDescription
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:33'
}
SLGTopic >> isCompleted [

	subtopics do: [ :each |
		(each isCompleted) ifFalse: [ ^false ] ].
	
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:27'
}
SLGTopic >> listenToSubtopicCompleted [
	
	subtopics do: [:each |
		each when: #subtopicCompleted send: #onSubtopicCompleted to: self ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 14:33'
}
SLGTopic >> onSubtopicCompleted [

	(self isCompleted) ifTrue: [ Transcript show: 'You have earned a badge for a topic ', self title; cr.
			self triggerEvent: #topicCompleted.
			SLGUserProgress userData updateTopicScore ]
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
	#'squeak_changestamp' : 'EB 6/26/2024 15:47'
}
SLGTopic >> subtopics: subtopicsCollection [
	subtopics := subtopicsCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
SLGTopic >> title [
	^ title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/26/2024 15:48'
}
SLGTopic >> title: aTitle [
	title := aTitle
]
