Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 14:46'
}
SLGHomePage >> createSubpage: aLabel at: aPosition [
	
	| subpage topicbutton |
	subpage := SLGTopicPage new.
	subpage homepage: self.
	topicbutton := SLGTopicButton newTopicButtonWithLabel: aLabel at: aPosition with: subpage.
	self addMorph: topicbutton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 14:47'
}
SLGHomePage >> initialize [
	super initialize.
	self createSubpage: 'Data Structures' at: self center.
	self createSubpage: 'Data Types' at: self center.
	
]
