Class {
	#name : #SLGMainController,
	#superclass : #Object,
	#instVars : [
		'routerController',
		'dataAccessService'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/12/2024 10:22'
}
SLGMainController class >> savedOpen [
	^SLGsavedApp 
		ifNil: [SLGsavedApp := self new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:04'
}
SLGMainController >> dataAccessService [
	^ dataAccessService
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:04'
}
SLGMainController >> dataAccessService: anObject [
	dataAccessService := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 15:53'
}
SLGMainController >> initialize [
	super initialize.
	
	self dataAccessService: SLGDataAccessService new.
	self routerController: SLGRouter new.
	
	self registerRoutes.
	
	self routerController navigateTo: '/home'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 02:24'
}
SLGMainController >> registerRoutes [
	self routerController 
		addRouteWithPath: '/home'
		withPage: (SLGHomePageView new initializeWithController: self).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:09'
}
SLGMainController >> routerController [
	^ routerController
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:09'
}
SLGMainController >> routerController: anObject [
	routerController := anObject
]
