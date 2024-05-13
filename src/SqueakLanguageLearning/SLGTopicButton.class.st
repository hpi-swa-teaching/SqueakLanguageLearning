Class {
	#name : #SLGTopicButton,
	#superclass : #SLGButton,
	#instVars : [
		'subPage',
		'subpage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:21'
}
SLGTopicButton class >> newTopicButtonWithLabel: aLabel at: aPosition with: aSubpage [
	|topicbutton|
	topicbutton := self new.
	topicbutton label: aLabel;
				center: aPosition;
				subpage: aSubpage.	
	^topicbutton.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:07'
}
SLGTopicButton class >> topicButtonColor [
	"initially all Topic-Buttns are gray. When a topic is completed the Button changes from gray to green."
	^Color gray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 13:37'
}
SLGTopicButton >> initialize [
	super initialize.
	self color: self class topicButtonColor.
	self on: #mouseUp send: #openSubpage to: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 13:36'
}
SLGTopicButton >> openSubpage [
	
	self subpage show.
	World addMorph: self subpage.
	self subpage homepage hide
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:04'
}
SLGTopicButton >> subpage [
	^ subpage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:56'
}
SLGTopicButton >> subpage: aSubpage [
	subpage := aSubpage
]
