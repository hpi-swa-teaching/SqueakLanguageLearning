Class {
	#name : #HomePageView,
	#superclass : #AbstractPage,
	#instVars : [
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 14:48'
}
HomePageView class >> newWithController: aController [

	^ super basicNew initializeWithController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 23:21'
}
HomePageView class >> newWithTopics: topics andController: aController [

	^ super basicNew initializeWithTopics: topics andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 11:18'
}
HomePageView >> constructView [
	| rows cols |
	rows := OrderedCollection new.
	
	rows addAll: self getTopicButtons.

	cols := SLGLayout columnWithMorphs: rows withGap: 20.
	
	cols center: self body center + (0 @ self body height * 0.1).
	
	self body addMorph: cols.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:18'
}
HomePageView >> createTopicPageWithTopic: aTopic [
	^TopicPageView new
		initializeWithTopic: aTopic
		andController: self controller;
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 23:29'
}
HomePageView >> getTopicButtonWithTopic: aTopic [
	| routeString button |
	
	routeString := ('/home/', aTopic title).
	
	self controller routerController
		addRouteWithPath: routeString 
		withPage: (self createTopicPageWithTopic: aTopic).
	
	button := SLGNavigationButtonGen new
		label: aTopic title;
		width: self class buttonWidth;
		height: 40px;
		borderWidth: 3px;
		borderColor: Color orange;
		cornerRadius: 15px;
		 onClickWithBlock: [
			self controller routerController navigateTo: routeString. ].
		
	(aTopic isCompleted) ifTrue: [button color: self class pastelGreen.].
	
	aTopic when: #topicCompleted evaluate: [button color: self class pastelGreen.].
	
	^button
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:28'
}
HomePageView >> getTopicButtons [
	^self topics collect: [:topic |
		self getTopicButtonWithTopic: topic
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 14:53'
}
HomePageView >> initializeWithController: aController [
	super initializeWithController: aController.
	self hideBackButton.
	self addTitle: 'Welcome to SqueakLingo!'.
	self topics: self controller dataAccessService topics.
	self constructView.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:20'
}
HomePageView >> topics [
	^ topics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:20'
}
HomePageView >> topics: anObject [
	topics := anObject
]
