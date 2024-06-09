Class {
	#name : #SLGTextGen,
	#superclass : #TextMorph,
	#instVars : [
		'content'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 16:04'
}
SLGTextGen class >> testText [
	| t |

	t := SLGMultilineTextGen new
		setText: 'Hello World!'.
	
	t openInHand.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:54'
}
SLGTextGen >> content [
	^ content
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:54'
}
SLGTextGen >> content: anObject [
	content := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/8/2024 19:24'
}
SLGTextGen >> initialize [
	super initialize.
	self content: ' '.
	self lock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:05'
}
SLGTextGen >> setFontSize: anInteger [

	 self fontName: 'LiberationSans' size: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:56'
}
SLGTextGen >> setText: aString [
	self content: aString.
	self contents: aString.
]
