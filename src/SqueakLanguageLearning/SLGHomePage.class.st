Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:48'
}
SLGHomePage >> initialize [
	|topicbutton subpage|
	super initialize.
	subpage := SLGTopicPage new.
	subpage homepage: self.
	topicbutton := SLGTopicButton newTopicButtonWithLabel: 'Data Structure' at: self center with: subpage.
	self addMorph: topicbutton.
	
]
