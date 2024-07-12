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
	#'squeak_changestamp' : 'yegi 7/11/2024 01:02'
}
SLGHomePageView class >> cornerRadius [
	
	^ 15
		
		
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 7/11/2024 16:24'
}
SLGHomePageView class >> newWithController: aController [
	
	^ (self newDefaultWithController: aController)
		setupHomepage;
		constructView;
		yourself

		
		
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:52'
}
SLGHomePageView >> constructView [

	| rows cols |
	self topics: self controller dataAccessService topics.
	rows := OrderedCollection new.
	rows addAll: self getTopicButtons.
	cols := SLGLayout columnWithMorphs: rows withGap: (self class gapHeight) px.
	cols center: self body center + (0 @ self body height * self class homeColumnCenterMargin).
	self body addMorph: cols
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:01'
}
SLGHomePageView >> createTopicButtonWithTopic: aTopic withRoute: aRoute [ 
	
	^ SLGNavigationButtonGen new label: aTopic title; width: (self class buttonWidth) px;
		 height: (self class buttonHeight + self class homeButtonHeightMargin) px;
		 borderWidth: (self class homeBorderWidth) px;
		 borderColor: Color orange;
		 cornerRadius: (self class cornerRadius) px;
		 onClickWithBlock: [self controller routerController navigateTo: aRoute];
		 yourself
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
	#'squeak_changestamp' : 'EB 7/11/2024 16:58'
}
SLGHomePageView >> getTopicButtonWithTopic: aTopic [

	| routeString button |
	routeString := '/home/' , aTopic title.
	self controller routerController addRouteWithPath: routeString withPage: (self createTopicPageWithTopic: aTopic).
	button := self createTopicButtonWithTopic: aTopic withRoute: routeString.
	self setButtonColorForCompletedTopic: aTopic forButton: button.
	
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
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 17:02'
}
SLGHomePageView >> setButtonColorForCompletedTopic: aTopic forButton: aButton [

	aTopic isCompleted ifTrue: [aButton color: self class pastelGreen].
	aTopic when: #topicCompleted evaluate: [aButton color: self class pastelGreen]
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/11/2024 16:12'
}
SLGHomePageView >> setupHomepage [

	self backButton hide.
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
	#'squeak_changestamp' : 'yegi 7/11/2024 19:38'
}
SLGHomePageView >> topics: aTopicsList [
	topics := aTopicsList
]
