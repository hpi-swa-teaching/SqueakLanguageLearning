"
This class manages the creation and interaction of data hierarchy and UI hierarchy, facilitating seamless integration between the application's logic and user interface.
"
Class {
	#name : #SLGMainController,
	#superclass : #Object,
	#instVars : [
		'routerController',
		'dataAccessService'
	],
	#category : #'SqueakLanguageLearning-Controllers',
	#'squeak_changestamp' : 'SW 7/11/2024 15:40'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 19:04'
}
SLGMainController >> dataAccessService [
	^ dataAccessService
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 13:15'
}
SLGMainController >> dataAccessService: aDataAccessService [
	dataAccessService := aDataAccessService
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:21'
}
SLGMainController >> initialize [

	super initialize.
	
	self
		dataAccessService: SLGDataAccessService new;
		routerController: SLGRouter new.
	
	self registerRoutes.
		
	self routerController navigateTo: '/home'
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 13:16'
}
SLGMainController >> registerRoutes [

	self routerController 
		addRouteWithPath: '/home'
		withPage: (SLGHomePageView newWithController: self)
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
	#'squeak_changestamp' : 'SW 7/11/2024 13:16'
}
SLGMainController >> routerController: aRouter [
	routerController := aRouter
]
