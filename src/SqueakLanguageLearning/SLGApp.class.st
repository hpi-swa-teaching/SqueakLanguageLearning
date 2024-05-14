Class {
	#name : #SLGApp,
	#superclass : #Object,
	#instVars : [
		'homepage',
		'topicList'
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
	#'squeak_changestamp' : 'EB 5/14/2024 12:09'
}
SLGApp class >> openWithProgress [
	"read from a file in the directory"
	SLGHomePage new open
]
