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
	#'squeak_changestamp' : 'EB 6/26/2024 12:28'
}
SLGTopic >> description: anObject [
	description := anObject
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
	#'squeak_changestamp' : 'EB 6/26/2024 12:29'
}
SLGTopic >> subtopics: anObject [
	subtopics := anObject
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
	#'squeak_changestamp' : 'EB 6/26/2024 12:28'
}
SLGTopic >> title: anObject [
	title := anObject
]
