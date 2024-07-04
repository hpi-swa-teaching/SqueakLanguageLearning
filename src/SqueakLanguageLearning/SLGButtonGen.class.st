Class {
	#name : #SLGButtonGen,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'callback'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/4/2024 18:00'
}
SLGButtonGen class >> buttonBorderWidth [

	^ 2px
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:01'
}
SLGButtonGen >> callback [

	^ callback value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/4/2024 18:01'
}
SLGButtonGen >> callback: aBlock [
	callback := aBlock
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/4/2024 18:02'
}
SLGButtonGen >> initialize [

	super initialize.
	
	self 
		target: [self callback];
		actionSelector: #value
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/4/2024 18:01'
}
SLGButtonGen >> onClickWithBlock: aBlock [

	self callback: aBlock
]
