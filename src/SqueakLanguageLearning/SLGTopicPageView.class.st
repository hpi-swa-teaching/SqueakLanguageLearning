Class {
	#name : #SLGTopicPageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'topic',
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:14'
}
SLGTopicPageView class >> newWithTopic: aTopic andController: aController [

	^super basicNew initializeWithTopic: aTopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 11:23'
}
SLGTopicPageView >> constructView [
	| rows cols |
	rows := OrderedCollection new.
	
	rows add: self getDescription.
	rows addAll: self getSubtopicButtons.

	cols := SLGLayout columnWithMorphs: rows withGap: 10px.
	
	cols center: self center + (0 @ self class iconMarginHeight * 0.3).
	
	self body addMorph: cols.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:08'
}
SLGTopicPageView >> createSubtopicPageWithSubtopic: aSubtopic [
	^SLGSubtopicPageView new
		initializeWithTopic: (self topic)
		andSubtopic: aSubtopic
		andController: self controller
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 10:18'
}
SLGTopicPageView >> getDescription [
	^SLGMultilineTextGen new 
		setFontSize: self class descriptionFont;
		width: self class descriptionWidth;
		setText: (self topic description);
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 04:00'
}
SLGTopicPageView >> getSubtopicButtonWithSubtopic: aSubtopic withRouteKey: aString [
	|routeString button |
	routeString := aString.
	
	self controller routerController addRouteWithPath: 
	routeString withPage: (self createSubtopicPageWithSubtopic: aSubtopic).
	
	button := SLGNavigationButtonGen new
		label: aSubtopic title;
		width: self class buttonWidth;
		borderWidth: 2;
		 onClickWithBlock: [
			self controller routerController navigateTo: routeString. ].
	
	(aSubtopic isCompleted) ifTrue: [button color: self class pastelGreen.].
	
	aSubtopic when: #subtopicCompleted evaluate: [button color: self class pastelGreen.].
	
	^button

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:31'
}
SLGTopicPageView >> getSubtopicButtons [
	^self subtopics collect: [:subtopic |
		self getSubtopicButtonWithSubtopic: subtopic
			withRouteKey:  ('/home/', self topic title, '/', subtopic title)
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/1/2024 15:06'
}
SLGTopicPageView >> initializeWithTopic: aTopic andController: aController [
	
	super initializeWithController: aController.
	self topic: aTopic.
	self subtopics: aTopic subtopics.
	self addTitle: aTopic title.
	
	self constructView.
	
	"aTopic when: #topicCompleted evaluate: [self updateTopicScoreDisplay]."
	
	
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
