Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 14:09'
}
SLGHomePage >> initialize [
	|topicbutton subpage|
	super initialize.
	subpage := SLGSubPage new.
	subpage homepage: self.
	topicbutton := SLGTopicButton newTopicButtonWithLabel: 'Data Structure' at: self center with: subpage.
	self addMorph: topicbutton.
	
]
