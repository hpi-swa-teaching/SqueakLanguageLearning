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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:15'
}
SLGLayout class >> columnWithMorphs: anArray [
	| container maxWidth sumHeight |
	
	container := Morph new.
	
	maxWidth := (anArray collect: [:a | a width]) inject: 0 into: [:a :c | (a > c)
	   ifTrue: [a]
	   ifFalse: [c]
	].
	sumHeight := 0. anArray do: [:a | sumHeight := sumHeight + (a height)]. sumHeight.	
	
	container width: maxWidth.
	container height: sumHeight.
	
	container layoutPolicy: TableLayout new.
	container listDirection: #bottomToTop.
	container color: Color transparent.
	
	anArray do: [:each |
		container addMorph: each.
	].

	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 14:02'
}
SLGLayout class >> columnWithMorphs: anArray withGap: anInt [
	| container |
	
	container := self columnWithMorphs: anArray.
	container cellGap: anInt.
	
	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:19'
}
SLGLayout class >> columnWithMorphsReversed: anArray withGap: anInt [
	| container maxWidth sumHeight |
	
	container := Morph new.
	
	maxWidth := (anArray collect: [:a | a width]) inject: 0 into: [:a :c | (a > c)
	   ifTrue: [a]
	   ifFalse: [c]
	].
	sumHeight := 0. anArray do: [:a | sumHeight := sumHeight + (a height)]. sumHeight.	
	
	container width: maxWidth.
	container height: sumHeight.
	
	container layoutPolicy: TableLayout new.
	container listDirection: #topToBottom.
	container color: Color transparent.
	
	anArray do: [:each |
		container addMorph: each.
	].
	container cellGap: anInt.

	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 17:55'
}
SLGLayout class >> rowWithMorphs: anArray [
	| container sumWidth maxHeight |
	
	container := Morph new.
	
	sumWidth := 0. anArray do: [:a | sumWidth := sumWidth + (a width)]. sumWidth.
	maxHeight := (anArray collect: [:a | a height]) inject: 0 into: [:a :c | (a > c)
	   ifTrue: [a]
	   ifFalse: [c]
	].

	container width: sumWidth.
	container height: maxHeight.
	
	container layoutPolicy: TableLayout new.
	container listDirection: #rightToLeft.
	container color: Color transparent.
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
