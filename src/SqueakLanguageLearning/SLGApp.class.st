Class {
	#name : #SLGApp,
	#superclass : #Object,
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
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:32'
}
SLGApp class >> openWithProgress [
	"read from a file in the directory"
	SLGHomePage new openInWorld center: Display center.
]
