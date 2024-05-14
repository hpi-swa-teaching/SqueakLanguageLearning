Class {
	#name : #SLGMenuButton,
	#superclass : #SLGButton,
	#instVars : [
		'subPage',
		'subpage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi park 5/14/2024 13:57'
}
SLGMenuButton class >> menuButtonColor [
	"initially all Topic-Buttns are gray. When a topic is completed the Button changes from gray to green."
	^Color lightMagenta
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:21'
}
SLGMenuButton class >> newTopicButtonWithLabel: aLabel at: aPosition with: aSubpage [
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
SLGMenuButton class >> topicButtonColor [
	"initially all Topic-Buttns are gray. When a topic is completed the Button changes from gray to green."
	^Color gray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi park 5/14/2024 13:59'
}
SLGMenuButton >> initialize [
	super initialize.
	self color: self class menuButtonColor.
	self on: #mouseUp send: #openSubpage to: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi park 5/14/2024 14:33'
}
SLGMenuButton >> openSubpage [
	
	self subpage show.
	self addMorph: self subpage.
	"self subpage homepage hide"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:04'
}
SLGMenuButton >> subpage [
	^ subpage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:56'
}
SLGMenuButton >> subpage: aSubpage [
	subpage := aSubpage
]
