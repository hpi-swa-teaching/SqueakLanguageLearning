Class {
	#name : #SLGRouter,
	#superclass : #Object,
	#instVars : [
		'routes',
		'routeHistory',
		'currentRouteIndex'
	],
	#classVars : [
		'Instance'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 23:38'
}
SLGRouter class >> addRoute: aString withPage: aPage [
	self instance addRouteWithRoute: (SLGRoute newRouteWithPath: aString withPage: aPage).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:44'
}
SLGRouter class >> initRouter [
	self instance: nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 17:03'
}
SLGRouter class >> instance [
	Instance == nil ifTrue: [
		self instance: SLGRouter new.
	].
	^ Instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:43'
}
SLGRouter class >> instance: anObject [
	Instance := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 23:34'
}
SLGRouter class >> navigateTo: aString [
	self instance navigateToWithPath: aString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 17:31'
}
SLGRouter >> addRouteWithRoute: aRoute [
	aRoute page open.
	aRoute page hide.
	self routes at: (aRoute path) put: aRoute.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 18:13'
}
SLGRouter >> currentRouteIndex [
	^ currentRouteIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 18:13'
}
SLGRouter >> currentRouteIndex: anObject [
	currentRouteIndex := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 18:24'
}
SLGRouter >> initialize [
	super initialize.
	self routes: Dictionary new.
	self routeHistory: OrderedCollection new.
	self currentRouteIndex: 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/5/2024 00:31'
}
SLGRouter >> navigateBack [
	
	| prevRoute curRoute lastRoute lastHistorySize |

	self currentRouteIndex - 1 > 0 ifFalse: [
		^false	
	].


	curRoute := self routeHistory at: (self currentRouteIndex).
	prevRoute := self routeHistory at: (self currentRouteIndex - 1).
	lastRoute := self routeHistory last.
	lastHistorySize := self routeHistory size.
	
	self navigateToWithPath: (prevRoute path) withCurrentPage: (curRoute page) withEnableHistory: false.
	self routeHistory removeLast.
	self currentRouteIndex: self routeHistory size.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 23:20'
}
SLGRouter >> navigateToWithPath: aString [

	self navigateToWithPath: aString withCurrentPage: nil withEnableHistory: true
	"| route curPage |
	
	Transcript show: 'navigate to ', aString; cr.
	route := self routes at: aString.
	
	self routeHistory size > 0 ifTrue: [
		curPage := self routeHistory last.
		Transcript show: curPage.
		curPage == nil ifFalse: [
			curPage page hide.
			Transcript show: curPage page.
			route page position: curPage page position.
		].
	].
	
	route page position: (aPage position).
	route page show.
	
	self routeHistory add: route.
	self currentRouteIndex: (self routeHistory size).
	"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 23:22'
}
SLGRouter >> navigateToWithPath: aString withCurrentPage: aPage [
	self navigateToWithPath: aString withCurrentPage: aPage withEnableHistory: true.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 23:59'
}
SLGRouter >> navigateToWithPath: aString withCurrentPage: aPage withEnableHistory: aBoolean [
	| route curPage |

	self routeHistory size > 0 ifTrue: [
		Transcript show: 'From "', (self routeHistory last path) ,'" navigate to "', aString, '"'; cr.
	].
	route := self routes at: aString.
	
	self routeHistory size > 0 ifTrue: [
		route == routeHistory last ifTrue: [
			^false
		].
	].
	
	aPage == nil ifFalse: [
			aPage hide.
			route page position: aPage position.
	].

	aPage == nil ifTrue: [
		self routeHistory size > 0 ifTrue: [
		curPage := self routeHistory last.
			curPage == nil ifFalse: [
				curPage page hide.
				route page position: curPage page position.
			].
		].
	].

	route page show.
	
	aBoolean ifTrue: [
		self routeHistory add: route.
		self currentRouteIndex: (self routeHistory size).
	].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 18:13'
}
SLGRouter >> routeHistory [
	^ routeHistory
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 18:13'
}
SLGRouter >> routeHistory: anObject [
	routeHistory := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:46'
}
SLGRouter >> routes [
	^ routes
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:46'
}
SLGRouter >> routes: anObject [
	routes := anObject
]
