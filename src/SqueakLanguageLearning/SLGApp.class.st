Class {
	#name : #SLGApp,
	#superclass : #Object,
	#instVars : [
		'homepage',
		'topicList'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/17/2024 09:26'
}
SLGApp class >> initialize [

	TheWorldMenu registerOpenCommand: {'SqueakLingo'. {self. #open}}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 13:31'
}
SLGApp class >> open [
	self openWithProgress.
	
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/12/2024 10:52'
}
SLGApp class >> openWithProgress [
	"read from a file in the directory"
	SLGMainController new
	
	"SLGMainController savedOpen"
]
