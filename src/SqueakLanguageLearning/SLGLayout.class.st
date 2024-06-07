Class {
	#name : #SLGLayout,
	#superclass : #Object,
	#instVars : [
		'elements',
		'maxWidth'
	],
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:33'
}
SLGLayout class >> columnWithMorphs: anArray [
	| container |
	
	container := Morph new.
	container layoutPolicy: TableLayout new.
	container listDirection: #bottomToTop.

	anArray do: [:each |
		container addMorph: each.
	].

	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:33'
}
SLGLayout class >> rowWithMorphs: anArray [
	| container |
	
	container := Morph new.
	container layoutPolicy: TableLayout new.
	container listDirection: #rightToLeft.

	anArray do: [:each |
		container addMorph: each.
	].

	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:41'
}
SLGLayout class >> testColumn [
	| container submorph1 submorph2 submorph3 |

	submorph1 := Morph new color: Color red; extent: 50@50.
	submorph2 := Morph new color: Color green; extent: 50@50.
	submorph3 := Morph new color: Color blue; extent: 50@50.

	container := SLGLayout columnWithMorphs: {submorph1.submorph2.submorph3}.

	container openInHand.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:17'
}
SLGLayout >> elements [
	^ elements
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:17'
}
SLGLayout >> elements: anObject [
	elements := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:27'
}
SLGLayout >> initialize [
	super initialize.
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:28'
}
SLGLayout >> maxWidth [
	^ maxWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:28'
}
SLGLayout >> maxWidth: anObject [
	maxWidth := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 14:29'
}
SLGLayout >> setup [
	
]