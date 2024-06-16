Class {
	#name : #SLGRouter,
	#superclass : #Object,
	#instVars : [
		'routes',
		'routeHistory',
		'currentRouteIndex'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:14'
}
SLGRouter >> addRouteWithPath: aString withPage: aPage [
	self addRouteWithRoute: (SLGRoute newRouteWithPath: aString withPage: aPage).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:12'
}
SLGRouter >> addRouteWithRoute: aRoute [
	aRoute page openInWorld.
	aRoute page hide.
	self routes at: (aRoute path) put: aRoute.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:14'
}
SLGRouter >> canNavigateWithNextRoute: aRoute [
	self routeHistory ifNotEmpty: [
		^(aRoute ~= self routeHistory last)
	].

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:51'
}
SLGRouter >> closeWindow [
	| curRoute |

	curRoute := self routeHistory at: (self currentRouteIndex).
	curRoute page delete.
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
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 15:58'
}
SLGRouter >> getRouteWithRouteString: aString [
	^self routes at: aString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:36'
}
SLGRouter >> handleCurrentPageWithCurrentPage: aPage1 withNextPage: aPage2 [
	| currentPage nextPage |
	currentPage := aPage1.
	nextPage := aPage2.
	
	currentPage ifNotNil: [
		self hideAndPositionWithCurrentPage: currentPage withNextPage: nextPage.
	].

	currentPage ifNil: [
		self routeHistory ifNotEmpty: [
			currentPage := self routeHistory last page.
			currentPage ifNotNil: [
				self hideAndPositionWithCurrentPage: currentPage withNextPage: nextPage.
			].
		].
	].

	nextPage show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:26'
}
SLGRouter >> hideAndPositionWithCurrentPage: aPage1 withNextPage: aPage2 [
	| currentPage nextPage |
	currentPage := aPage1.
	nextPage := aPage2.
	currentPage hide.
	nextPage position: currentPage position.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:08'
}
SLGRouter >> initialize [
	super initialize.
	self routes: Dictionary new.
	self routeHistory: OrderedCollection new.
	self currentRouteIndex: 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:12'
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
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:06'
}
SLGRouter >> navigateTo: aString [
	self navigateToWithPath: aString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:38'
}
SLGRouter >> navigateToWithPath: aString [
	self navigateToWithPath: aString withCurrentPage: nil withEnableHistory: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:36'
}
SLGRouter >> navigateToWithPath: aString withCurrentPage: aPage withEnableHistory: aBoolean [
	| nextRoute |

	self routeHistory size > 0 ifTrue: [
		Transcript show: 'From "', (self routeHistory last path) ,'" navigate to "', aString, '"'; cr.
	].

	nextRoute := self getRouteWithRouteString: aString.
	
	(self canNavigateWithNextRoute: nextRoute) ifFalse: [ ^false ].
	
	self handleCurrentPageWithCurrentPage: aPage withNextPage: nextRoute page.
	
	self tryToRefreshPageWithPage: nextRoute page.
	
	aBoolean ifTrue: [
		self updateHistoryWithRoute: nextRoute.
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:31'
}
SLGRouter >> tryToRefreshPageWithPage: aPage [
	| exists |
	
	exists := aPage respondsTo: #refresh.
	
	exists ifTrue: [
		aPage refresh.
	]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:35'
}
SLGRouter >> updateHistoryWithRoute: aRoute [
	self routeHistory add: aRoute.
	self currentRouteIndex: (self routeHistory size).
]
