Class {
	#name : #TopicPage,
	#superclass : #NavigationPage,
	#instVars : [
		'subtopicPages'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:55'
}
TopicPage class >> newWithTopic: aTopic [
	^super new initializeWithTopic: aTopic
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 21:42'
}
TopicPage >> initializeWithTopic: aTopic [

	| subtopicPagesDictionary |
	
	self addTitle: aTopic title.
	subtopicPagesDictionary := Dictionary new.
	
	aTopic subtopics do: [:subtopic |
            | subtopicPage |
            subtopicPage := SubtopicPage newWithSubtopic: subtopic.
            subtopicPagesDictionary at: subtopic title put: subtopicPage.
        ].
	
	super initializeWithPagesDictionary: subtopicPagesDictionary.	
]
