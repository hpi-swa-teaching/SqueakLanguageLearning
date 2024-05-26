Class {
	#name : #HomePage,
	#superclass : #Page,
	#instVars : [
		'topicPages',
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'MyOwnCategory-Pages'
}

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
	#'squeak_changestamp' : 'EB 5/26/2024 15:52'
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
