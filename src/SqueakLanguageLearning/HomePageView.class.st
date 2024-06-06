Class {
	#name : #HomePageView,
	#superclass : #AbstractNavigationPage,
	#instVars : [
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 14:48'
}
HomePageView class >> newWithController: aController [

	^ super basicNew initializeWithController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 23:21'
}
HomePageView class >> newWithTopics: topics andController: aController [

	^ super basicNew initializeWithTopics: topics andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 13:47'
}
HomePageView >> buttonClicked: buttonIndex [

	| topic |
	topic := topics at: buttonIndex.
	controller handleTopicSelected: topic.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 19:47'
}
HomePageView >> initializeWithController: aController [
	
	| topicTitles topicTitle |
	super initializeWithController: aController.
	self addTitle: 'Welcome to Squeak Language Learning!'.
	controller := aController.
	topics := controller topics.
	
	topicTitles := Array new: (topics size).
	topics withIndexDo: [:topic :index |
		topicTitle := topic title.
		topicTitles at: index put: topicTitle.
        ].
	
	self addButtonsWithTitles: topicTitles.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:13'
}
HomePageView >> initializeWithTopics: topicsList andController: aController [
	
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
