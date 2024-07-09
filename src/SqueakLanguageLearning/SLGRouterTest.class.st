"
This class tests the navigation system within SqueakLanguageLearning.
"
Class {
	#name : #SLGRouterTest,
	#superclass : #TestCase,
	#instVars : [
		'router'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/5/2024 17:47'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 14:37'
}
SLGRouterTest class >> classNamesNotUnderTest [

	^ #(SLGDataAccessService)
]

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 12:04'
}
SLGRouterTest >> setUp [

	super setUp.
	
	router := SLGRouter new

	
]

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 13:18'
}
SLGRouterTest >> tearDown [
	
	router closeWindow.
	
	super tearDown
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 12:49'
}
SLGRouterTest >> testAddRouteWithPath [

	| routeString page |
	routeString := 'myRoute'.
	page := SLGAbstractPage new.
	
	router addRouteWithPath: routeString withPage: page.
	
	self assert: (router routes includesKey: routeString).
	self assert: ((router routes at: routeString) page == page)
	
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 12:49'
}
SLGRouterTest >> testCloseWindow [

	router addRouteWithPath: '1' withPage: Morph new.
	router navigateTo: '1'.
	router closeWindow.
	
	self assert: (router routes includes:  '1') not
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:00'
}
SLGRouterTest >> testNavigateBack [

	router addRouteWithPath: '1' withPage: Morph new.
	router addRouteWithPath: '2' withPage: Morph new.
	
	router navigateTo: '1'.
	router navigateTo: '2'.
	router navigateBack.
	
	self assert: (router routeHistory last path) = '1'

]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 14:00'
}
SLGRouterTest >> testNavigateTo [

	router addRouteWithPath: '1' withPage: Morph new.
	router addRouteWithPath: '2' withPage: Morph new.
	
	router navigateTo: '1'.
	
	self assert: (router routeHistory last path) = '1'.
	
	router navigateTo: '2'.
	
	self assert: (router routeHistory last path) = '2'.
	
	router navigateTo: '1'.
	
	self assert: (router routeHistory last path) = '1'
]
