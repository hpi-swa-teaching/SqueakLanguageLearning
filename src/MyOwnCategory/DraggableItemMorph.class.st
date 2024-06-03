Class {
	#name : #DraggableItemMorph,
	#superclass : #Morph,
	#instVars : [
		'label',
		'parentMorph',
		'isDragging',
		'offset'
	],
	#category : #'MyOwnCategory-Tasks'
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
	#'squeak_changestamp' : 'EB 5/23/2024 11:57'
}
DraggableItemMorph >> drag: anEvent [

        isDragging ifTrue: [
            self position: anEvent position - offset.
        ]
	
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 16:35'
}
DraggableItemMorph >> handleDrop: anEvent [

 	| targetUnderCursor key value  |       
	isDragging := false.
        parentMorph ifNotNil: [
            targetUnderCursor := parentMorph findTargetUnderCursor.
		parentMorph updateItemTargetMap: self target: targetUnderCursor ].
	
	Transcript show: 'itemTargetMap after drop:'; cr.
	parentMorph itemTargetMap keysAndValuesDo: [ :k :v |
	    key := k asString.
	    value := v label asString.
    Transcript show: 'Key: ', key, ', Value: ', value; cr].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 15:46'
}
DraggableItemMorph >> initializeWithLabel: aString inMorph: aMorph [

        self initialize.
        label := aString.
        isDragging := false.
        offset := 0@0.
        parentMorph := aMorph. "Set the parent morph"
        self position: 0@0. "Initial position"
        self extent: 100@50. "Set dimensions"
        self borderWidth: 1.
        self borderColor: Color black.
        self color: Color lightGray.
        self addMorph: (StringMorph contents: aString).

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
