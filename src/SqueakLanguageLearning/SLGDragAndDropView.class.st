Class {
	#name : #SLGDragAndDropView,
	#superclass : #SLGTaskView,
	#instVars : [
		'submitButton',
		'draggableItems',
		'answerSlots',
		'itemSlotMap'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:35'
}
SLGDragAndDropView class >> errorMessage [

	^ 'Please position all of the given items.'
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:32'
}
SLGDragAndDropView class >> newWithTask: aSLGDragAndDropTask [

	^ self new
		task: aSLGDragAndDropTask;
		code: aSLGDragAndDropTask code;
		taskQuestion: aSLGDragAndDropTask question;
		setup;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'EB 6/5/2024 22:32'
}
SLGDragAndDropView class >> taskDescription [

	^ 'Drag the item to the correct gap.'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> answerSlots [
	^ answerSlots
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> answerSlots: anObject [
	answerSlots := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/13/2024 15:14'
}
SLGDragAndDropView >> createInteractiveItemsAndTargets [
    
	| shuffledOptions correctAnswers answerSlots item row columns rowLayout columnLayout|

	shuffledOptions := self task getShuffledOptions.
	correctAnswers := self task correctAnswer.
	
	answerSlots := self createSlotsWith: correctAnswers.
	
	row := OrderedCollection new.
	shuffledOptions do: [:option |
        item := DraggableItemMorph newWithLabel: option inMorph: self.
			Transcript show: item position; cr.
			row add: item.
        draggableItems add: item.].
	rowLayout := SLGLayout rowWithMorphs: row.
	columns := OrderedCollection new.
	columns add: answerSlots; add: rowLayout.
	columnLayout := SLGLayout columnWithMorphs: columns withGap: self class taskElementsMargin.
	"row do: [:i | columnLayout addMorph: i.
		]. "
	
	^columnLayout
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/15/2024 13:25'
}
SLGDragAndDropView >> createItemsAndTargets [
    
	| container xPosItem shuffledOptions correctAnswers answerSlots item "numAnswers step" |
	container := Morph new.
	container bounds: "(0@0 extent: 900@500);" "(0@0 extent: ((self class taskElementWidth) * 0.75)@400);" (0@0 extent: (self class taskElementWidth) * 1.2 @ 300px);
            color: Color gray. "DEBUGGING"
		"color: Color transparent. "

	xPosItem := 100.

	shuffledOptions := self task getShuffledOptions.
	correctAnswers := self task correctAnswer.
	
	answerSlots := self createSlotsWith: correctAnswers.
	answerSlots position: (container position)." + (0 @ 100px))."
	container addMorph: answerSlots.   
	
	shuffledOptions do: [:option |
        item := DraggableItemMorph newWithLabel: option inMorph: self.
	  item position: (container position + (xPosItem@280)).
        container addMorph: item.
        draggableItems add: item.
        xPosItem := xPosItem + 150 ].
	
	^container
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/15/2024 13:31'
}
SLGDragAndDropView >> createSlotsWith: correctAnswers [

	| container slot numAnswers step |
	container := Morph new.
	container color: Color white; "transparent" 
			extent: self class taskElementWidth @ 200px.  "800 @ 150." "TODO change the size of a container"

	numAnswers := correctAnswers size.
	step := container width / (numAnswers * 2 + 1).
	 
	correctAnswers do: [:correctAnswer |
		slot := AnswerSlotMorph newWithLabel: correctAnswer.
		answerSlots add: slot.
		itemSlotMap at: slot put: nil.
		slot lock.

		slot position: container position +  (step @ 40px). "(step @ 100)."
		step := (step +(500//numAnswers)px)."150)." "TODO should be calculated,""gap between answer box"
		container addMorph: slot. ].

	^container.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> draggableItems [
	^ draggableItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> draggableItems: anObject [
	draggableItems := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 6/1/2024 23:07'
}
SLGDragAndDropView >> findTargetUnderCursor [

	| cursorPos |
	cursorPos := Sensor cursorPoint.
	
	^ answerSlots detect: [:target | 
		target bounds containsPoint: cursorPos] 
		ifNone: [nil]
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> initialize [

	super initialize.
	
	self draggableItems: OrderedCollection new.
	self answerSlots: OrderedCollection new.
	self itemSlotMap: OrderedDictionary new.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/10/2024 15:03'
}
SLGDragAndDropView >> itemSlotMap [
	^ itemSlotMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> itemSlotMap: anObject [
	itemSlotMap := anObject
]

{
	#category : #verification,
	#'squeak_changestamp' : 'EB 6/10/2024 15:23'
}
SLGDragAndDropView >> passUserInput [

	| itemsAtSlots anAnswer targetCorrectMap |
	
	targetCorrectMap ifNil:  [ targetCorrectMap := OrderedDictionary new ].
	itemsAtSlots ifNil: [ itemsAtSlots := OrderedCollection new ].
	itemSlotMap keysAndValuesDo: [:slot :item |
		(item isKindOf: DraggableItemMorph) ifTrue: [
			itemsAtSlots add: item label ].
		targetCorrectMap at: slot put: (item label = slot label) ].
	
	targetCorrectMap keysAndValuesDo: [:target :correct |
            target color: (correct ifTrue: [Color lightGreen] ifFalse: [Color red]).
        ].

	anAnswer := itemsAtSlots asArray.
	
	^ anAnswer
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/15/2024 12:45'
}
SLGDragAndDropView >> setup [

	|interactive|
	
	"interactive := self createInteractiveItemsAndTargets."
	interactive := self createItemsAndTargets.
	"interactive position:( self position + (50 @ 300))."
	self addMorph: interactive.
	super setupWith: interactive.

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 6/10/2024 14:54'
}
SLGDragAndDropView >> updateItemSlotMap: anItem atSlot: aSlot [

        itemSlotMap at: aSlot put: anItem.
]
