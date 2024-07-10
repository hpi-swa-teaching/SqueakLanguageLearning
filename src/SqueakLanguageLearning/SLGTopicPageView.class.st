"
This class can be used to create a Topic page(the page with all the subtopic buttons shown after clicking topic button on Home page).
"
Class {
	#name : #SLGTopicPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'topic',
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Pages',
	#'squeak_changestamp' : 'yegi 7/9/2024 10:39'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'yegi 7/10/2024 12:23'
}
SLGTopicPageView class >> newWithTopic: aTopicObject andController: aControllerObject [

	^ self new
		controller: aControllerObject;
		topic: aTopicObject;	
		constructView;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 12:25'
}
SLGTopicPageView >> constructView [

	| rows cols |
	self subtopics: self topic subtopics;
		 addTitle: self topic title.
	rows := OrderedCollection new.	
	rows add: self getDescription.
	rows addAll: self getSubtopicButtons.
	cols := SLGLayout columnWithMorphs: rows withGap: self class topicGapHeight.
	cols center: self center + (0 @ self class iconMarginHeight * self class topicPageColumnCenterMargin).
	
	self body addMorph: cols
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 14:41'
}
SLGTopicPageView >> createSubtopicPageWithSubtopic: aSubtopic [ 
	
	^ SLGSubtopicPageView
		newWithTopic: self topic
		andSubtopic: aSubtopic
		andController: self controller
		
		
		"^ SLGSubtopicPageView new
	initializeWithTopic: (self topic)
	andSubtopic: aSubtopic
	andController: self controller"
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 12:05'
}
SLGTopicPageView >> getDescription [
	
	^ SLGMultilineTextGen new 
		setFontSize: self class descriptionFont;
		width: self class descriptionWidth;
		setText: (self topic description);
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:39'
}
SLGTopicPageView >> getSubtopicButtonWithSubtopic: aSubtopic withRouteKey: aString [

	|routeString button |
	routeString := aString.
	
	self controller routerController addRouteWithPath: 
	routeString withPage: (self createSubtopicPageWithSubtopic: aSubtopic).
	
	button := SLGNavigationButtonGen new
		label: aSubtopic title;
		width: self class buttonWidth;
		 onClickWithBlock: [
			self controller routerController navigateTo: routeString. ];
		yourself.
	
	(aSubtopic isCompleted) ifTrue: [button color: self class pastelGreen.].
	
	aSubtopic when: #subtopicCompleted evaluate: [button color: self class pastelGreen.].
	
	^ button

]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 12:04'
}
SLGTopicPageView >> getSubtopicButtons [
	
	^ self subtopics collect: [:subtopic |
		self getSubtopicButtonWithSubtopic: subtopic
			withRouteKey:  ('/home/', self topic title, '/', subtopic title)]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 7/10/2024 12:30'
}
SLGTopicPageView >> initialize [

	super initialize.
	
	"self subtopics: self topic subtopics;
		addTitle: self topic title."
	"self constructView"
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:47'
}
SLGTopicPageView >> subtopics [
	^ subtopics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:47'
}
SLGTopicPageView >> subtopics: anObject [
	subtopics := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:22'
}
SLGTopicPageView >> topic [
	^ topic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:22'
}
SLGTopicPageView >> topic: anObject [
	topic := anObject
]
