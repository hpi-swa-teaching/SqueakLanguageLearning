"
This class takes care of navigation between pages, enabling the use of the next, back and close button.
"
Class {
	#name : #SLGRouter,
	#superclass : #Object,
	#instVars : [
		'routes',
		'routeHistory'
	],
	#category : #'SqueakLanguageLearning-Controllers',
	#'squeak_changestamp' : 'SW 7/11/2024 15:41'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:18'
}
SLGRouter >> addRouteWithPath: aString withPage: aPage [

	self addRouteWithRoute: (SLGRoute newRouteWithPath: aString withPage: aPage)
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:19'
}
SLGRouter >> addRouteWithRoute: aRoute [

	aRoute page openInWorld.
	aRoute page hide.
	self routes at: (aRoute path) put: aRoute
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> canNavigateWithNextRoute: aRoute [

	self routeHistory ifNotEmpty: [
		^(aRoute ~= self routeHistory last)].

	^ true
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> closeAllWindows [
	
	self routes do: [:route |
			route page delete]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:20'
}
SLGRouter >> getRouteWithRouteString: aString [

	^ self routes at: aString
]

{
	#category : #actions,
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
	#category : #actions,
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> initialize [

	super initialize.
	
	self routes: Dictionary new.
	self routeHistory: OrderedCollection new
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/11/2024 14:08'
}
SLGRouter >> navigateBack [
	
	| previousRoute currentRoute |

	self routeHistory ifEmpty: [
		^false	
	].

	currentRoute := self routeHistory last.
	previousRoute := self routeHistory at: (self routeHistory size - 1).
	
	self navigateToWithPath: (previousRoute path) withCurrentPage: (currentRoute page) withEnableHistory: false.
	self routeHistory removeLast
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SW 7/11/2024 13:22'
}
SLGRouter >> navigateTo: aString [

	self navigateToWithPath: aString withCurrentPage: nil withEnableHistory: true
]

{
	#category : #actions,
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
	#category : #actions,
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
	#category : #update,
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> tryToRefreshPageWithPage: aPage [

	| exists |
	
	exists := aPage respondsTo: #refresh.
	
	exists 
		ifTrue: [aPage refresh]
	
]

{
	#category : #update,
	#'squeak_changestamp' : 'SW 7/11/2024 13:23'
}
SLGRouter >> updateHistoryWithRoute: aRoute [

	self routeHistory add: aRoute
]
