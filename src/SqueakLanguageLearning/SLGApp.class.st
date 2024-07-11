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
	#category : #'system startup',
	#'squeak_changestamp' : 'SW 5/17/2024 09:26'
}
SLGApp class >> initialize [

	TheWorldMenu registerOpenCommand: {'SqueakLingo'. {self. #open}}
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'SW 7/11/2024 13:09'
}
SLGApp class >> open [
	
	SLGMainController new
	
		
]
