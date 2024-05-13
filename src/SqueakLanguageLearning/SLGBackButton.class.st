Class {
	#name : #SLGBackButton,
	#superclass : #SLGButton,
	#instVars : [
		'subpage'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:52'
}
SLGBackButton class >> newGoBackButton: aSubpage [

	| goBackButton |
	goBackButton := self new.
	goBackButton subpage: aSubpage.
	
	^ goBackButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:34'
}
SLGBackButton class >> newGoBackButtonAt: aPosition with: aSubpage [

	| goBackButton |
	goBackButton := self new.
	goBackButton position: aPosition.
	goBackButton subpage: aSubpage.
	
	^ goBackButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 13:53'
}
SLGBackButton >> backToHomepage [

	self subpage hide.
	self subpage homepage show
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 13:54'
}
SLGBackButton >> initialize [
	
	super initialize.
	self label: 'Back to Homepage'.
	self on: #mouseUp send: #backToHomepage to: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:32'
}
SLGBackButton >> subpage [
	^ subpage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/13/2024 11:33'
}
SLGBackButton >> subpage: aSubpage [
	subpage := aSubpage
]
