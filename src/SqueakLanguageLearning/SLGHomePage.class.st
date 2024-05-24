Class {
	#name : #SLGHomePage,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'topicList'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:55'
}
SLGHomePage >> createButtonsWith: aTopicList [
  |yPos xPos buttonSpacing |
   
      buttonSpacing := 50.

	 yPos := self bounds top + (self bounds height // 2).
	 xPos := self bounds center x.
	 	 
	self topicList do: [ :buttonName |
          self createSubpage: buttonName at: xPos @ yPos.
          yPos := yPos - buttonSpacing.
      ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi park 5/14/2024 14:26'
}
SLGHomePage >> createMenupage: aLabel at: aPosition [
	
	| menupage menubutton |
	menupage := SLGMenuPage new.
	menupage homepage: self.
	menubutton := SLGMenuButton newTopicButtonWithLabel: aLabel at: aPosition with: menupage.
	self addMorph: menubutton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:53'
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
	#'squeak_changestamp' : 'SW 5/18/2024 16:03'
}
SLGHomePage >> initialize [
	super initialize.
	self createMenupage: 'Menu' at: self topLeft + (80@60).
	self createButtonsWith: self topicList.
	
	
	
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/21/2024 20:54'
}
SLGHomePage >> topicList [
	^ {'Squeak'.'Morphic'.'Methods'.'Classes'.'Data Structures'.'Control Flow'.'Data Types'}
]
