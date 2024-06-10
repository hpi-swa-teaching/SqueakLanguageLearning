Class {
	#name : #SLGNavigationButtonGen,
	#superclass : #SLGButtonGen,
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:43'
}
SLGNavigationButtonGen >> initialize [
	super initialize.
	self color: Color veryVeryLightGray.
	self borderWidth: 2.
	self borderColor: Color veryVeryLightGray.
	self cornerStyle: #rounded.
	self cornerRadius: 20.
]
