Class {
	#name : #DraggableItemMorph,
	#superclass : #Morph,
	#instVars : [
		'label',
		'parentMorph',
		'isDragging',
		'offset'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 15:23'
}
DraggableItemMorph class >> newWithLabel: aString inMorph: aDragAndDropMorph [

	^ self basicNew initializeWithLabel: aString inMorph: aDragAndDropMorph
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:46'
}
DraggableItemMorph class >> slotBorderWidth [
	^2px	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:46'
}
DraggableItemMorph class >> slotCornerRadius [
	^10px
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:47'
}
DraggableItemMorph class >> slotExtent [
	^60px @ 30px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 11:57'
}
DraggableItemMorph >> drag: anEvent [

        isDragging ifTrue: [
            self position: anEvent position - offset.
        ]
	
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/10/2024 15:31'
}
DraggableItemMorph >> handleDrop: anEvent [

 	| targetUnderCursor key value  |       
	isDragging := false.
        parentMorph ifNotNil: [
            targetUnderCursor := parentMorph findTargetUnderCursor.
		targetUnderCursor ifNotNil: [ parentMorph updateItemSlotMap: self atSlot: targetUnderCursor ].
	].
	
	Transcript show: 'itemTargetMap after drop:'; cr.
	parentMorph itemSlotMap keysAndValuesDo: [ :k :v |
		key := k asString.
		(v isNil not)
			ifTrue: [ value := v label asString ]
			ifFalse: [ value := 'empty' ].

    Transcript show: 'Key: ', key, ', Value: ', value; cr].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:48'
}
DraggableItemMorph >> initializeWithLabel: aString inMorph: aMorph [

	| test |	
        self initialize.
        label := aString.
        isDragging := false.
        parentMorph := aMorph. "Set the parent morph"
        self "position: 0 @ 0;" "Initial position"
        	extent: self class slotExtent; "Set dimensions"
       	borderWidth: self class slotBorderWidth;
        	borderColor: Color white;
        	color: Color transparent;
		cornerStyle: #rounded;
		cornerRadius: self class slotCornerRadius.
	
	test := StringMorph contents: aString.
	test center: self center.
	  self addMorph: test."(StringMorph contents: aString)."

        self on: #mouseDown send: #startDrag: to: self.
        self on: #mouseUp send: #handleDrop: to: self.
        self on: #mouseMove send: #drag: to: self.

	^ self
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/21/2024 19:29'
}
DraggableItemMorph >> label [

	^ label
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 11:59'
}
DraggableItemMorph >> startDrag: anEvent [
        
	isDragging := true.
	offset := anEvent position - self position.
	
	
	

]
