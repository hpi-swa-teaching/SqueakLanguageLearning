Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:07'
}
SLGHomePage >> initialize [
	|topicbutton|
	super initialize.
	topicbutton := TopicButtons newTopicButtonWithLabel: 'Data Structure' at: self center with: (SLGSubpage new).
	self addMorph: topicbutton.
	
]
