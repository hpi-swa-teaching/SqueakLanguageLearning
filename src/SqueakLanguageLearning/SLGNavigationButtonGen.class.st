Class {
	#name : #SLGNavigationButtonGen,
	#superclass : #SLGButtonGen,
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/12/2024 23:10'
}
SLGNavigationButtonGen >> initialize [
	super initialize.
	self color: Color white.
	self borderWidth: 2.
	self borderColor: Color white.
	self cornerStyle: #rounded.
	self cornerRadius: 20.
]
