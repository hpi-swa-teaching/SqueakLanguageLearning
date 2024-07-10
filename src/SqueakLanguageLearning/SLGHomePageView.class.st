"
This class can be used to create a home page(first page the user will see).
"
Class {
	#name : #SLGHomePageView,
	#superclass : #SLGAbstractPage,
	#instVars : [
		'topics'
	],
	#classInstVars : [
		'topicButtons'
	],
	#category : #'SqueakLanguageLearning-Pages',
	#'squeak_changestamp' : 'yegi 7/9/2024 10:36'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'yegi 7/10/2024 11:10'
}
SLGHomePageView class >> newWithController: aControllerObject [
	
	^ self new
		controller: aControllerObject;
		constructView;
		yourself

		
		
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 13:56'
}
SLGHomePageView >> constructView [

	| rows cols |
	self topics: self controller dataAccessService topics.
	rows := OrderedCollection new.
	rows addAll: self getTopicButtons.
	cols := SLGLayout columnWithMorphs: rows withGap: self class gapHeight.
	cols center: self body center + (0 @ self body height * self class homeColumnCenterMargin).
	
	self body addMorph: cols
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/10/2024 10:15'
}
SLGHomePageView >> createTopicButtonWithTopic: aTopic [

	| routeString button |
	routeString := ('/home/', aTopic title).
	button := SLGNavigationButtonGen new
		label: aTopic title;
		width: self class buttonWidth;
		height: self class buttonHeight + self class homeButtonHeightMargin;
		borderWidth: self class homeBorderWidth;
		borderColor: Color orange;
		cornerRadius: self class homeCornerRadius;
		onClickWithBlock: [
			self controller routerController navigateTo: routeString];
		yourself.
	
	^ button
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 17:59'
}
SLGHomePageView >> createTopicPageWithTopic: aTopic [
	
	^ SLGTopicPageView newWithTopic: aTopic andController: self controller

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 12:21'
}
SLGHomePageView >> getTopicButtonWithTopic: aTopic [

	| routeString button |	
	routeString := ('/home/', aTopic title).
	
	self controller routerController
		addRouteWithPath: routeString 
		withPage: (self createTopicPageWithTopic: aTopic).
	button := self createTopicButtonWithTopic: aTopic.
		
	(aTopic isCompleted) ifTrue: [button color: self class pastelGreen].
	aTopic when: #topicCompleted evaluate: [button color: self class pastelGreen].
	
	^ button 
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/10/2024 18:01'
}
SLGHomePageView >> getTopicButtons [
	
	^ self topics collect: [:topic |
		self getTopicButtonWithTopic: topic]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 7/10/2024 11:42'
}
SLGHomePageView >> initialize [

	super initialize.

	self hideBackButton.
	self addTitle: 'Welcome to SqueakLingo!'
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:20'
}
SLGHomePageView >> topics [
	^ topics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:20'
}
SLGHomePageView >> topics: anObject [
	topics := anObject
]
