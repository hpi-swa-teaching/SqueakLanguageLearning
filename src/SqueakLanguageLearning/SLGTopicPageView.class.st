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
	#'squeak_changestamp' : 'yegi 7/11/2024 01:08'
}
SLGTopicPageView >> constructView [

	| rows cols |
	self subtopics: self topic subtopics;
		 addTitle: self topic title.
	rows := OrderedCollection new.	
	rows add: self getDescription.
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
	#'squeak_changestamp' : 'yegi 7/11/2024 00:56'
}
SLGTopicPageView >> getDescription [
	
	^ SLGMultilineTextGen new 
		setFontSize: (self class descriptionFont) px;
		width: (self class descriptionWidth) px;
		setText: (self topic description);
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 23:55'
}
SLGTopicPageView >> getSubtopicButtonWithSubtopic: aSubtopic withRouteKey: aString [

	|routeString button |
	routeString := aString.
	self controller routerController addRouteWithPath: 
		routeString withPage: (self createSubtopicPageWithSubtopic: aSubtopic).
	button := self createSubtopicButtonWithTopic: aSubtopic withRoute: routeString.
	self subtopicsCompletedCheck: aSubtopic withColor: button.
	
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
	#'squeak_changestamp' : 'yegi 7/10/2024 23:48'
}
SLGTopicPageView >> subtopicsCompletedCheck: aSubtopic withColor: aButton [

	(aSubtopic isCompleted) ifTrue: [aButton color: self class pastelGreen].
	aSubtopic when: #subtopicCompleted evaluate: [aButton color: self class pastelGreen]
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
