Class {
	#name : #Topic,
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
Topic class >> newWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:32'
}
Topic class >> title: aTitle description: aDescription subtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
Topic >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/13/2024 19:49'
}
Topic >> initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

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
Topic >> isCompleted [

	subtopics do: [ :each |
		(each isCompleted) ifFalse: [ ^false. ] ].
	
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/13/2024 19:50'
}
Topic >> onSubtopicCompleted [

	"Give a badge"
	(self isCompleted)
		ifTrue: [ Transcript show: 'You have earned a badge for a topic ', self title; cr. ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:08'
}
Topic >> subtopics [
	^ subtopics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
Topic >> title [
	^ title
]
