Class {
	#name : #SLGRoute,
	#superclass : #Object,
	#instVars : [
		'path',
		'page'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 17:15'
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
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:44'
}
SLGRoute >> page: anObject [
	page := anObject
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
	#'squeak_changestamp' : 'Alexander Netz 6/4/2024 16:44'
}
SLGRoute >> path: anObject [
	path := anObject
]
