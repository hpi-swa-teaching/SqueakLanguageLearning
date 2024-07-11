"
This class represents a draggable item for SLGDragAndDropView.
"
Class {
	#name : #SLGDraggableItemMorph,
	#superclass : #Morph,
	#instVars : [
		'label',
		'parentMorph',
		'isDragging',
		'offset'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:25'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:46'
}
SLGDraggableItemMorph class >> newWithLabel: aString inMorph: aDragAndDropMorph [

	^ self new
		label: aString;
		parentMorph: aDragAndDropMorph;
		setup;
		yourself
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:47'
}
SLGDraggableItemMorph class >> slotBorderWidth [

	^ 2 px	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:47'
}
SLGDraggableItemMorph class >> slotCornerRadius [

	^ 10 px
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 7/11/2024 14:47'
}
SLGDraggableItemMorph class >> slotExtent [

	^ 60 px @ 30 px
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:47'
}
SLGDraggableItemMorph >> drag: anEvent [

        self isDragging ifTrue: [
            self position: anEvent position - self offset]
	
	

]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 15:48'
}
SLGDraggableItemMorph >> handleDrop: anEvent [ 

	| targetUnderCursor itemName |
	self isDragging: false.
	self parentMorph 
		ifNotNil: [targetUnderCursor := self parentMorph findTargetUnderCursor.
			targetUnderCursor
				ifNotNil: [self parentMorph updateItemSlotMap: self atSlot: targetUnderCursor]].
			
	self parentMorph itemSlotMap
		keysAndValuesDo: [:key :value | 
			value isNil not
				ifTrue: [itemName := value label asString]
				ifFalse: [itemName := 'empty']]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 14:46'
}
SLGDraggableItemMorph >> initialize [

	super  initialize.
	
	self
		extent: self class slotExtent;
       	borderWidth: self class slotBorderWidth;
        	borderColor: Color white;
        	color: Color transparent;
		cornerStyle: #rounded;
		cornerRadius: self class slotCornerRadius
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:13'
}
SLGDraggableItemMorph >> isDragging [
	^ isDragging
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:52'
}
SLGDraggableItemMorph >> isDragging: aBoolean [
	isDragging := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:51'
}
SLGDraggableItemMorph >> label [
	^ label
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:51'
}
SLGDraggableItemMorph >> label: aString [
	label := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:14'
}
SLGDraggableItemMorph >> offset [
	^ offset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:52'
}
SLGDraggableItemMorph >> offset: aPosition [
	offset := aPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:14'
}
SLGDraggableItemMorph >> parentMorph [
	^ parentMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/11/2024 14:52'
}
SLGDraggableItemMorph >> parentMorph: aDragAndDropMorph [
	parentMorph := aDragAndDropMorph
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:46'
}
SLGDraggableItemMorph >> setup [

	| text |
	
	text := StringMorph new contents: self label.
	text center: self center.
	self addMorph: text.
	
	self isDragging: false.
		
	self on: #mouseDown send: #startDrag: to: self.
      self on: #mouseUp send: #handleDrop: to: self.
      self on: #mouseMove send: #drag: to: self

]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:52'
}
SLGDraggableItemMorph >> startDrag: anEvent [
        
	self isDragging: true.
	self offset: anEvent position - self position
	
	

]
