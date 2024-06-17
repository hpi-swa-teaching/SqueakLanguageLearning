Class {
	#name : #SLGRouterTest,
	#superclass : #TestCase,
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/14/2024 22:10'
}
SLGRouterTest >> testAddRouteWithPath [
	| router routeString page |
	
	routeString := 'myRoute'.
	page := SLGAbstractPage new.
	router := SLGRouter new.
	
	router addRouteWithPath: routeString withPage: page.
	
	self assert: (router routes includesKey: routeString).
	self assert: ((router routes at: routeString) page == page).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/14/2024 22:30'
}
SLGRouterTest >> testCloseWindow [
	| router  |
	
	router := SLGRouter new.
	
	router addRouteWithPath: '1' withPage: Morph new.
	
	router navigateTo: '1'.
	
	router closeWindow.
	
	self assert: (router routes includes:  '1') not.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/14/2024 22:31'
}
SLGRouterTest >> testNavigateBack [
	| router  |
	
	router := SLGRouter new.
	
	router addRouteWithPath: '1' withPage: Morph new.
	router addRouteWithPath: '2' withPage: Morph new.
	
	router navigateTo: '1'.
	router navigateTo: '2'.
	
	router navigateBack.
	
	self assert: (router routeHistory last path) == '1'.
	
	router closeWindow.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/14/2024 22:31'
}
SLGRouterTest >> testNavigateTo [
	| router  |
	
	router := SLGRouter new.
	
	router addRouteWithPath: '1' withPage: Morph new.
	router addRouteWithPath: '2' withPage: Morph new.
	
	router navigateTo: '1'.
	
	self assert: (router routeHistory last path) == '1'.
	
	router navigateTo: '2'.
	
	self assert: (router routeHistory last path) == '2'.
	
	router navigateTo: '1'.
	
	self assert: (router routeHistory last path) == '1'.
	
	router closeWindow.
]
