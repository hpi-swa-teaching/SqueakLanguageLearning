Class {
	#name : #TopicPageView,
	#superclass : #AbstractPage,
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
TopicPageView class >> newWithTopic: aTopic andController: aController [

	^super basicNew initializeWithTopic: aTopic andController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:04'
}
TopicPageView >> constructView [
	| rows cols |
	rows := OrderedCollection new.
	
	rows add: self getDescription.
	rows addAll: self getSubtopicButtons.

	cols := SLGLayout columnWithMorphs: rows withGap: 20.
	
	cols center: self center.
	
	self body addMorph: cols.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:05'
}
TopicPageView >> createSubtopicPageWithSubtopic: aSubtopic [
	^SubtopicPageView new
		initializeWithTopic: (self topic)
		andSubtopic: aSubtopic
		andController: self controller
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 10:18'
}
TopicPageView >> getDescription [
	^SLGMultilineTextGen new 
		setFontSize: self class descriptionFont;
		width: self class descriptionWidth;
		setText: (self topic description);
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/13/2024 20:52'
}
TopicPageView >> getSubtopicButtonWithSubtopic: aSubtopic withRouteKey: aString [
	|routeString button |
	routeString := aString.
	
	self controller routerController addRouteWithPath: 
	routeString withPage: (self createSubtopicPageWithSubtopic: aSubtopic).
	
	button := SLGNavigationButtonGen new
		label: aSubtopic title;
		width: self class buttonWidth;
		 onClickWithBlock: [
			self controller routerController navigateTo: routeString. ].
	
	(aSubtopic isCompleted) ifTrue: [button color: Color green.].
	
	aSubtopic when: #subtopicCompleted evaluate: [button color: Color green.].
	
	^button

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:31'
}
TopicPageView >> getSubtopicButtons [
	^self subtopics collect: [:subtopic |
		self getSubtopicButtonWithSubtopic: subtopic
			withRouteKey:  ('/home/', self topic title, '/', subtopic title)
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:50'
}
TopicPageView >> initializeWithTopic: aTopic andController: aController [
	
	super initializeWithController: aController.
	self topic: aTopic.
	self subtopics: aTopic subtopics.
	self addTitle: aTopic title.
	
	self constructView.
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:47'
}
TopicPageView >> subtopics [
	^ subtopics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:47'
}
TopicPageView >> subtopics: anObject [
	subtopics := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:22'
}
TopicPageView >> topic [
	^ topic
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:22'
}
TopicPageView >> topic: anObject [
	topic := anObject
]
