"
This class represents the general button used in SqueakLanguageLearning. It enables multiple functions for a button by using a callback.
"
Class {
	#name : #SLGButtonGen,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'callback'
	],
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:36'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:46'
}
SLGButtonGen class >> buttonBorderWidth [

	^ 2 px
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:36'
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
	#'squeak_changestamp' : 'SW 7/5/2024 09:43'
}
SLGButtonGen >> initialize [

	super initialize.
	
	self 
		target: [self callback];
		actionSelector: #value
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SW 7/5/2024 09:43'
}
SLGButtonGen >> onClickWithBlock: aBlock [

	self callback: aBlock
]
