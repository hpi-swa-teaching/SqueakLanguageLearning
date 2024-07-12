"
This class allows display of longer texts wrapped on a page, e.g., used for descriptions of topics.
"
Class {
	#name : #SLGMultilineTextGen,
	#superclass : #SLGTextGen,
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:34'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 08:43'
}
SLGMultilineTextGen >> initialize [

	super initialize.
	
	self wrapFlag: true
]
