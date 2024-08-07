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
	#category : #'instance creation',
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
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/9/2024 14:36'
}
SLGTopic >> isCompleted [

	^ (self subtopics detect: [ :each | 
				each isCompleted not ] ifNone: [ nil ]) isNil
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'EB 7/9/2024 14:15'
}
SLGTopic >> listenToSubtopicCompleted [
	
	self subtopics do: [:each |
		each when: #subtopicCompleted send: #onSubtopicCompleted to: self ]
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'SW 7/11/2024 17:55'
}
SLGTopic >> onSubtopicCompleted [

	(self isCompleted)
		ifTrue: [
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
