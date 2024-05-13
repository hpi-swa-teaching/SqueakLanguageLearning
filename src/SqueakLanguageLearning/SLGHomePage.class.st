Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:20'
}
SLGHomePage class >> topicList [

	^ ['Data types', 'Control flow', 'Data structure'].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:03'
}
SLGHomePage >> createSubpage: aLabel at: aPosition [
	
	| subpage topicbutton |
	subpage := SLGSubPage new.
	subpage homepage: self.
	topicbutton := SLGTopicButton newTopicButtonWithLabel: aLabel at: aPosition with: subpage.
	self addMorph: topicbutton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:08'
}
SLGHomePage >> initialize [
	super initialize.
	self createSubpage: 'Data Structures' at: self center.
	self createSubpage: 'Data Types' at: self center.
	
	
	
]
