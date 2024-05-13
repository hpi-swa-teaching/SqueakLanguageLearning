Class {
	#name : #SLGApp,
	#superclass : #Object,
	#instVars : [
		'homepage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:31'
}
SLGApp class >> open [
	self openWithProgress.
	
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:39'
}
SLGApp class >> openWithProgress [
	"read from a file in the directory"
	SLGHomePage new open.
]
