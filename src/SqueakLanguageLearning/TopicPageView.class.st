Class {
	#name : #TopicPageView,
	#superclass : #AbstractNavigationPage,
	#instVars : [
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:14'
}
TopicPageView class >> newWithTopic: aTopic andController: aController [

	^super basicNew initializeWithTopic: aTopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:24'
}
TopicPageView >> addDescriptionTo: aTopic [

	| description descriptionForm |

	description := aTopic description.
	descriptionForm := TextMorph new.
	descriptionForm contents:  description asText;
					wrapFlag: true;
					width: 1000;
					position: (self position + (100@500)). 
	
	
	self addMorph: descriptionForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 13:47'
}
TopicPageView >> buttonClicked: buttonIndex [

	| subtopic |
	subtopic := subtopics at: buttonIndex.
	controller handleSubtopicSelected: subtopic.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 10:59'
}
TopicPageView >> initializeWithTopic: aTopic andController: aController [
	
	| subtopicTitles subtopicTitle |
	super initializeWithController: aController.
	self addTitle: aTopic title.
	self addDescriptionTo: aTopic.
	
	subtopics := aTopic subtopics.
	subtopicTitles := Array new: (subtopics size).
	subtopics withIndexDo: [:subtopic :index |
		subtopicTitle := subtopic title.
		subtopicTitles at: index put: subtopicTitle.
        ].
	
	self addButtonsWithTitles: subtopicTitles.
	self addBackButton.
	
	
	
]
