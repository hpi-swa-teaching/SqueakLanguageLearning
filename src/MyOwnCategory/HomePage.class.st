Class {
	#name : #HomePage,
	#superclass : #Page,
	#instVars : [
		'topics',
		'topicPagesTabPanel'
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
	#'squeak_changestamp' : 'EB 5/26/2024 15:52'
}
HomePage >> addButtons [

        | topics |
	topics := dataReader readFileAsCollection: '/Applications/SWT2024.app/Contents/Resources/list-of-topics.txt'.
        "topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types')."
        topics withIndexDo: [:topic :index |
            | button |
	button := SimpleButtonMorph new label: topic.
	button position: (self position + (500@(index * 75))).
	button target: self.
	button actionSelector: #navigateToTopic:.
            "button on: #mouseUp send: #navigateToTopic: to: self."
            "button argument: topic.  Store the topic as an argument"
	button arguments: { topic }.
            self addMorph: button.
        ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:44'
}
HomePage >> addButtonsWithTopics: topics [

	 "topics := dataReader readFileAsCollection: '/Applications/SWT2024.app/Contents/Resources/list-of-topics.txt'.
        topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types')."
        topics withIndexDo: [:topic :index |
            | button |
		button := SimpleButtonMorph new label: topic title.
		button position: (self position + (500@(index * 75))).
		button target: self.
		button actionSelector: #navigateToTopic:.
	            "button on: #mouseUp send: #navigateToTopic: to: self."
	            "button argument: topic.  Store the topic as an argument"
		button arguments: { topic title }.
	      self addMorph: button.
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:42'
}
HomePage >> createTopicPages [

        | topics |
	topics := dataReader readFileAsCollection: '/Applications/SWT2024.app/Contents/Resources/list-of-topics.txt'.
	"topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types') asOrderedCollection. "
	topics do: [:topic |
            | topicPage |
            topicPage := TopicPage new.
            topicPage addTitle: topic.
            topicPage addBackButton.
            topicPage createSubtopicPagesFor: topic.
            topicPagesTabPanel at: topic put: topicPage.
        ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:42'
}
HomePage >> createTopicPagesWithTopics: topics [


	"topics := dataReader readFileAsCollection: '/Applications/SWT2024.app/Contents/Resources/list-of-topics.txt'.
	topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types') asOrderedCollection. "
	topics do: [:topic |
            | topicPage |
            topicPage := TopicPage newWithTopic: topic.
           " topicPage addTitle: topic title.
            topicPage addBackButton.
            topicPage createSubtopicPagesFor: topic."
            topicPagesTabPanel at: topic title put: topicPage.
        ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:42'
}
HomePage >> initialize [

	super initialize.
	self addTitle: 'Welcome to Squeak Language Learning'.
	
	self addButtons.
	topicPagesTabPanel := Dictionary new.
	self createTopicPages
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:47'
}
HomePage >> initializeWithTopics: topics [
	
	| topicPagesDictionary |
	super initialize.
	self addTitle: 'Welcome to Squeak Language Learning'.
	
	topicPagesDictionary := Dictionary new.
	topics do: [:topic |
            | topicPage |
            topicPage := TopicPage newWithTopic: topic.
            topicPagesDictionary at: topic title put: topicPage.
        ].
	
	topicPagesTabPanel := TabPanel newWithPagesDictionary: topicPagesDictionary.
	self addMorph: topicPagesTabPanel.
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:42'
}
HomePage >> navigateToTopic: aTopicTitle [

        | topicPage |
        topicPage := topicPagesTabPanel at: aTopicTitle.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: topicPage.
        topicPage show.
	
]
