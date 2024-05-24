Class {
	#name : #HomePage,
	#superclass : #Page,
	#instVars : [
		'topicPages'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 21:18'
}
HomePage >> addButtons [

        | topics |
        topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types').
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
	#'squeak_changestamp' : 'EB 5/23/2024 23:29'
}
HomePage >> createTopicPages [
        | topics |
        topics := #('Squeak' 'Morphic' 'Methods' 'Classes' 'Data Structures' 'Control Flow' 'Data Types').
        topics do: [:topic |
            | topicPage |
            topicPage := TopicPage new.
            topicPage addTitle: topic.
            topicPage addBackButton.
            topicPage createSubtopicPagesFor: topic.
            topicPages at: topic put: topicPage.
        ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:29'
}
HomePage >> initialize [

	super initialize.
	self addTitle: 'Welcome to Squeak Language Learning'.
	self addButtons.
	topicPages := Dictionary new.
	self createTopicPages
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:29'
}
HomePage >> navigateToTopic: aTopic [

        | topicPage |
        topicPage := topicPages at: aTopic.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: topicPage.
        topicPage show.
	
]
