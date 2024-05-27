Class {
	#name : #TopicPage,
	#superclass : #Page,
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
	#'squeak_changestamp' : 'EB 5/26/2024 15:42'
}
TopicPage >> createSubtopicPagesFor: aTopic [

        | subtopics  button |
        subtopics := self subtopicsForTopic: aTopic.
        subtopics withIndexDo: [:subTopic :index |
            | subtopicPage |
            subtopicPage := SubtopicPage new.
            subtopicPage addTitle: subTopic.
            subtopicPage addBackButton.
            subtopicPage createLessonPagesFor: subTopic.
            subtopicPages at: subTopic put: subtopicPage.

            button := SimpleButtonMorph new label: subTopic.
            button position: (self position + (500@(index * 75))).
            button target: self.
            button actionSelector: #navigateToSubTopic:.
            button arguments: { subTopic }.
            self addMorph: button.
        ]. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:52'
}
TopicPage >> initialize [

	super initialize.
	self addBackButton.
	subtopicPages := Dictionary new.
	
	 "topicPage addTitle: topic title.
       topicPage addBackButton.
       topicPage createSubtopicPagesFor: topic."
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:54'
}
TopicPage >> initializeWithTopic: aTopic [

	super initialize.
	
	 self addTitle: aTopic title.
       self addBackButton.
       "topicPage createSubtopicPagesFor: topic."
	
	"subtopicPages := Dictionary new."
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:24'
}
TopicPage >> navigateToSubTopic: aSubtopic [ 

        | subtopicPage |
        subtopicPage := subtopicPages at: aSubtopic.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: subtopicPage.
        subtopicPage show.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:22'
}
TopicPage >> subtopicsForTopic: aTopic [ 
        "Return a list of sub-topics for the given topic. This is a placeholder implementation."
        ^#('Sub-topic 1' 'Sub-topic 2' 'Sub-topic 3')
]
