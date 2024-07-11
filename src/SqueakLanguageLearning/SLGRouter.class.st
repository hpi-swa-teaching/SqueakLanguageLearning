Class {
	#name : #SLGRouter,
	#superclass : #Object,
	#instVars : [
		'routes',
		'routeHistory'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:18'
}
SLGRouter >> addRouteWithPath: aString withPage: aPage [

	self addRouteWithRoute: (SLGRoute newRouteWithPath: aString withPage: aPage)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:19'
}
SLGRouter >> addRouteWithRoute: aRoute [

	aRoute page openInWorld.
	aRoute page hide.
	self routes at: (aRoute path) put: aRoute
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> canNavigateWithNextRoute: aRoute [

	self routeHistory ifNotEmpty: [
		^(aRoute ~= self routeHistory last)].

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> closeAllWindows [
	
	self routes do: [:route |
			route page delete]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> getRouteWithRouteString: aString [

	^ self routes at: aString
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:21'
}
SLGRouter >> handleCurrentPageWithCurrentPage: aPage1 withNextPage: aPage2 [

	| currentPage nextPage |
	
	currentPage := aPage1.
	nextPage := aPage2.
	
	currentPage ifNotNil: [
		self hideAndPositionWithCurrentPage: currentPage withNextPage: nextPage].

	currentPage ifNil: [
		self routeHistory ifNotEmpty: [
			currentPage := self routeHistory last page.
			currentPage ifNotNil: [
				self hideAndPositionWithCurrentPage: currentPage withNextPage: nextPage]]].

	nextPage show
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> hideAndPositionWithCurrentPage: aPage1 withNextPage: aPage2 [

	| currentPage nextPage |
	
	currentPage := aPage1.
	nextPage := aPage2.
	currentPage hide.
	nextPage position: currentPage position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> initialize [

	super initialize.
	
	self routes: Dictionary new.
	self routeHistory: OrderedCollection new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> navigateBack [
	
	| previousRoute currentRoute lastRoute lastHistorySize |

	self routeHistory ifEmpty: [
		^false	
	].

	currentRoute := self routeHistory last.
	previousRoute := self routeHistory at: (self routeHistory size - 1).
	lastRoute := self routeHistory last.
	lastHistorySize := self routeHistory size.
	
	self navigateToWithPath: (previousRoute path) withCurrentPage: (currentRoute page) withEnableHistory: false.
	self routeHistory removeLast
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> navigateTo: aString [

	self navigateToWithPath: aString withCurrentPage: nil withEnableHistory: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> navigateToWithPath: aString withCurrentPage: aPage withEnableHistory: aBoolean [

	| nextRoute |

	nextRoute := self getRouteWithRouteString: aString.
	
	(self canNavigateWithNextRoute: nextRoute) ifFalse: [ ^false ].
	
	self handleCurrentPageWithCurrentPage: aPage withNextPage: nextRoute page.
	
	self tryToRefreshPageWithPage: nextRoute page.
	
	aBoolean ifTrue: [
		self updateHistoryWithRoute: nextRoute]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> navigateToWithoutHistory: aString withCurrentPage: aPage [

	self navigateToWithPath: aString withCurrentPage: aPage withEnableHistory: false
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
	#'squeak_changestamp' : 'SW 7/11/2024 13:18'
}
SLGRouter >> routeHistory: anOrderedCollection [
	routeHistory := anOrderedCollection
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
	#'squeak_changestamp' : 'SW 7/11/2024 13:18'
}
SLGRouter >> routes: aDictionary [
	routes := aDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> tryToRefreshPageWithPage: aPage [

	| exists |
	
	exists := aPage respondsTo: #refresh.
	
	exists 
		ifTrue: [aPage refresh]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> updateHistoryWithRoute: aRoute [

	self routeHistory add: aRoute
]
