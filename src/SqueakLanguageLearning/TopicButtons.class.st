Class {
	#name : #TopicButtons,
	#superclass : #SLGButtons,
	#instVars : [
		'subPage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:42'
}
TopicButtons class >> newTopicButtonWithLabel: aLabel at: aPosition [ 
	|topicbutton|
	topicbutton := self new.
	topicbutton 
	label: aLabel;
	center: aPosition;
	color: Color gray. "if it's completed, then it is marked with green"
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:00'
}
TopicButtons class >> newTopicButtonWithLabel: aLabel at: aPosition with: aSubpage [
	|topicbutton|
	topicbutton := self new.
	topicbutton 
	label: aLabel;
	center: aPosition;
	color: Color gray; "if it's completed, then it is marked with green"
	subPage: aSubpage.
	
	^topicbutton.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:08'
}
TopicButtons >> initialize [
	super initialize.
	self on: #mouseUp send: #openSubPage to: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:08'
}
TopicButtons >> openSubPage [

	self subPage openInWorld.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:47'
}
TopicButtons >> subPage [
	^ subPage
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:44'
}
TopicButtons >> subPage: aSubpage [
	subPage := aSubpage.
]
