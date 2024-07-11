Class {
	#name : #SLGRoute,
	#superclass : #Object,
	#instVars : [
		'path',
		'page'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 7/11/2024 13:24'
}
SLGRoute class >> newRouteWithPath: aString withPage: aPage [

	^self new
		path: aString;
		page: aPage;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:44'
}
SLGRoute >> page [
	^ page
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 13:18'
}
SLGRoute >> page: aPage [
	page := aPage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:44'
}
SLGRoute >> path [
	^ path
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 13:17'
}
SLGRoute >> path: aString [
	path := aString
]
