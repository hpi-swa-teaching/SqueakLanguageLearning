Class {
	#name : #TopicPage,
	#superclass : #NavigationPage,
	#instVars : [
		'subtopicPages',
		'description'
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
	#'squeak_changestamp' : 'EB 5/28/2024 12:28'
}
TopicPage >> addDescriptionTo: aTopic [

	| descriptionForm |

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
	#'squeak_changestamp' : 'EB 5/28/2024 11:54'
}
TopicPage >> initializeWithTopic: aTopic [

	| subtopicPagesDictionary |
	
	self addTitle: aTopic title.
	self addDescriptionTo: aTopic.
	subtopicPagesDictionary := Dictionary new.
	
	aTopic subtopics do: [:subtopic |
            | subtopicPage |
            subtopicPage := SubtopicPage newWithSubtopic: subtopic.
            subtopicPagesDictionary at: subtopic title put: subtopicPage.
        ].
	
	super initializeWithPagesDictionary: subtopicPagesDictionary.	
]
