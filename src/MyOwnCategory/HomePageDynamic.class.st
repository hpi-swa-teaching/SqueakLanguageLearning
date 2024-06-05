Class {
	#name : #HomePageDynamic,
	#superclass : #NavigationPageDynamic,
	#instVars : [
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'MyOwnCategory-DynamicPages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 23:21'
}
HomePageDynamic class >> newWithTopics: topics andController: aController [

	^ super basicNew initializeWithTopics: topics andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 13:47'
}
HomePageDynamic >> buttonClicked: buttonIndex [

	| topic |
	topic := topics at: buttonIndex.
	controller handleTopicSelected: topic.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:13'
}
HomePageDynamic >> initializeWithTopics: topicsList andController: aController [
	
	| topicTitles topicTitle |
	super initializeWithController: aController.
	self addTitle: 'Welcome to Squeak Language Learning (Dynamic)'.
	controller := aController.
	topics := topicsList.
	
	topicTitles := Array new: (topics size).
	topics withIndexDo: [:topic :index |
		topicTitle := topic title.
		topicTitles at: index put: topicTitle.
        ].
	
	self addButtonsWithTitles: topicTitles.
	
	
]
