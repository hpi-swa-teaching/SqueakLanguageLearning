Class {
	#name : #SLGSubpage,
	#superclass : #AbstractPage,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 11:21'
}
SLGSubpage >> backToHomepage [
	SLGHomepage open.
	self delete

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 11:21'
}
SLGSubpage >> createBackButton [
	|backButton|
	backButton := SimpleButtonMorph new.
	backButton label:  'Back to Homepage'.
	backButton on: #mouseUp send: #backToHomepage to: self.
	backButton position: ((self width - backButton width)/2)@0.
	self addMorph: backButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:11'
}
SLGSubpage >> initialize [ 
super initialize.
	"self color: Color white;
		extent: 600@900.
	self createBackButton
"
]
