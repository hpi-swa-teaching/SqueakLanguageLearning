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
	#'squeak_changestamp' : 'EB 7/11/2024 16:25'
}
SLGTopicPageView class >> newWithTopic: aTopic andController: aController [

	^ (self newDefaultWithController: aController)
		topic: aTopic;	
		constructView;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:04'
}
SLGTopicPageView >> constructView [

	| rows cols |
	self subtopics: self topic subtopics;
		 addTitle: self topic title.
	rows := OrderedCollection new.	
	rows add: self getTopicDescription.
	rows addAll: self getSubtopicButtons.
	cols := SLGLayout columnWithMorphs: rows withGap: (self class topicGapHeight) px.
	cols center: self center + (0 @ (self class iconMarginHeight) px * self class topicPageColumnCenterMargin).
	self body addMorph: cols
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:55'
}
SLGTopicPageView >> createSubtopicButtonWithTopic: aSubtopic withRoute: aRoute [ 

	^ SLGNavigationButtonGen new 
		label: aSubtopic title;
		width: (self class buttonWidth) px;
		onClickWithBlock: [self controller routerController navigateTo: aRoute];
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 19:55'
}
SLGTopicPageView >> createSubtopicPageWithSubtopic: aSubtopic [ 
	
	^ SLGSubtopicPageView
		newWithTopic: self topic
		andSubtopic: aSubtopic
		andController: self controller
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:03'
}
SLGTopicPageView >> getSubtopicButtonWithSubtopic: aSubtopic withRouteKey: aString [

	|routeString button |
	routeString := aString.
	self controller routerController addRouteWithPath: 
		routeString withPage: (self createSubtopicPageWithSubtopic: aSubtopic).
	button := self createSubtopicButtonWithTopic: aSubtopic withRoute: routeString.
	self setButtonColorForCompletedSubtopic: aSubtopic forButton: button.
	
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
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:04'
}
SLGTopicPageView >> getTopicDescription [
	
	^ SLGMultilineTextGen new 
		setFontSize: (self class descriptionFont) px;
		width: (self class descriptionWidth) px;
		setText: (self topic description);
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:03'
}
SLGTopicPageView >> setButtonColorForCompletedSubtopic: aSubtopic forButton: aButton [

	(aSubtopic isCompleted) ifTrue: [aButton color: self class pastelGreen].
	aSubtopic when: #subtopicCompleted evaluate: [aButton color: self class pastelGreen]
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
	#'squeak_changestamp' : 'yegi 7/11/2024 19:40'
}
SLGTopicPageView >> subtopics: aSubtopicsCollection [
	subtopics := aSubtopicsCollection
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
	#'squeak_changestamp' : 'yegi 7/11/2024 19:40'
}
SLGTopicPageView >> topic: aTopicsList [
	topic := aTopicsList
]
