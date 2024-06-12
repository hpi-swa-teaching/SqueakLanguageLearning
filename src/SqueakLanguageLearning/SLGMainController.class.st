Class {
	#name : #SLGMainController,
	#superclass : #Object,
	#instVars : [
		'routerController',
		'navigationController',
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
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:21'
}
SLGMainController >> initialize [
	super initialize.
	
	self dataAccessService: DataAccessService new.
	self routerController: SLGRouter new.
	self navigationController: (NavigationController newWithTopics: (dataAccessService topics)).
	
	self registerRoutes.
	
	self routerController navigateTo: '/home'.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:04'
}
SLGMainController >> navigationController [
	^ navigationController
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:04'
}
SLGMainController >> navigationController: anObject [
	navigationController := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 20:33'
}
SLGMainController >> registerRoutes [
	self routerController addRouteWithPath: '/home' withPage: (HomePageView new initializeWithController: self).
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
