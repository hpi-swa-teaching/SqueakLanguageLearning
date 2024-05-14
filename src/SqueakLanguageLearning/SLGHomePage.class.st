Class {
	#name : #SLGHomePage,
	#superclass : #AbstractPage,
	#instVars : [
		'topicList'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/14/2024 12:09'
}
SLGHomePage >> createButtonsWith: aTopicList [
  |yPos xPos buttonSpacing buttonNames |
   
      buttonSpacing := 50. 
  	buttonNames := {'Data Types'. 'Control Flow'. 'Data Structures'. 'Classes'. 'Methods'. 'Morphic'. 'Squeak'}.

	 yPos := self bounds top + (self bounds height // 2).
	 xPos := self bounds center x.
  
 	buttonNames ifNil: [Transcript show: 'A collection is nil.'].	
	 	 
	buttonNames do: [ :buttonName |
          self createSubpage: buttonName at: xPos @ yPos.
          yPos := yPos - buttonSpacing.
      ].
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
	#'squeak_changestamp' : 'EB 5/14/2024 11:15'
}
SLGHomePage >> initialize [
	super initialize.
	"self createSubpage: 'Data Structures' at: self center."
	"self createSubpage: 'Data Types' at: self center."
	self topicList ifNil: [Transcript show: 'A collection is nill'].
	self createButtonsWith: self topicList.
	
	
	
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/14/2024 10:25'
}
SLGHomePage >> topicList [
	^ topicList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/14/2024 10:26'
}
SLGHomePage >> topicList: aTopicCollection [	
	topicList := aTopicCollection
]
