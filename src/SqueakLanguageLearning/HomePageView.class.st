Class {
	#name : #HomePageView,
	#superclass : #AbstractNavigationPage,
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
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:46'
}
HomePageView >> initializeWithController: aController [
	| cols rows |
	super initializeWithController: aController.
	self addTitle: 'Welcome to Squeak Language Learning (Dynamic)'.
	controller := aController.
	topics := controller dataAccessService topics.
	
	rows := topics collect: [:topic |
		| btn |
		self controller routerController addRouteWithPath: ('/home/', topic title) withPage: (TopicPageView new initializeWithTopic: topic andController: controller).
		
		btn := SLGButtonGen new
			label: topic title;
			width: 400;
			 onClickWithBlock: [
				self controller routerController navigateTo: ('/home/', topic title).
			].
		
		SLGLayout columnWithMorphs: {
			btn.
			SLGSpacerGen newSpacerWithDim: (0@20)
		}
	].
	
	cols := SLGLayout columnWithMorphs: rows.
	
	cols center: self center.
	
	self addMorph: cols.
	
]
