Class {
	#name : #HomePage,
	#superclass : #NavigationPage,
	#instVars : [
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:39'
}
HomePage class >> newWithTopics: topics [

	^ super new initializeWithTopics: topics
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/28/2024 21:23'
}
HomePage >> initializeWithTopics: topics [
	
	| topicPagesDictionary |
	
	self addTitle: 'Welcome to Squeak Language Learning'.
	topicPagesDictionary := Dictionary new.
	
	topics do: [:topic |
            | topicPage |
            topicPage := TopicPage newWithTopic: topic.
            topicPagesDictionary at: topic title put: topicPage.
		World addMorph: topicPage.
		topicPage hide.
        ].
	
	super initializeWithPagesDictionary: topicPagesDictionary.	
	
	
]
