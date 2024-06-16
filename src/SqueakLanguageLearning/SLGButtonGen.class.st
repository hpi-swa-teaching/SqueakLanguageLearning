Class {
	#name : #SLGButtonGen,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'callback'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 23:28'
}
SLGButtonGen class >> buttonBorderWidth [
	^2px
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:14'
}
SLGButtonGen >> callback [
	^ callback value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:14'
}
SLGButtonGen >> callback: anObject [
	callback := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:15'
}
SLGButtonGen >> initialize [
	super initialize.
	self
		target: [self callback];
		actionSelector: #value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:13'
}
SLGButtonGen >> onClickWithBlock: aBlock [
	self callback: aBlock.
]
