Class {
	#name : #SLGNavigationButtonGen,
	#superclass : #SLGButtonGen,
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 23:28'
}
SLGNavigationButtonGen >> initialize [
	super initialize.
	self color: Color white;
		borderWidth: self class buttonBorderWidth;
		borderColor: Color white;
		cornerStyle: #rounded;
		cornerRadius: 20.
]
