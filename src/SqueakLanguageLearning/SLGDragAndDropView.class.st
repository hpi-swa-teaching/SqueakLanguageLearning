"
This class provides the UI for drag and drop.
"
Class {
	#name : #SLGDragAndDropView,
	#superclass : #SLGTaskView,
	#instVars : [
		'submitButton',
		'draggableItems',
		'answerSlots',
		'itemSlotMap'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:32'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:15'
}
SLGDragAndDropView class >> containerHeight [

	^ 200 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:35'
}
SLGDragAndDropView class >> errorMessage [

	^ 'Please position all of the given items.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:17'
}
SLGDragAndDropView class >> itemSpace [

	^ 10 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:46'
}
SLGDragAndDropView class >> itemVerticalSpacing [

	^ 100 px
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:16'
}
SLGDragAndDropView class >> slotHeight [

	^ 100 px

	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:00'
}
SLGDragAndDropView class >> slotSpace [

	^ 5 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:48'
}
SLGDragAndDropView class >> slotVerticalOffset [

	^ 50 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:47'
}
SLGDragAndDropView class >> slotVerticalSpacing [

	^ 30 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'EB 6/5/2024 22:32'
}
SLGDragAndDropView class >> taskDescription [

	^ 'Drag the item to the correct gap.'
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:47'
}
SLGDragAndDropView >> addShuffledOptionsWithin: aContainer withPosition: aPosition [

	| shuffledOptions item step |
	
	shuffledOptions := self task getShuffledOptions.
	step := aPosition.
	
	shuffledOptions do: [:option |
		item := SLGDraggableItemMorph newWithLabel: option inMorph: self.
	  	item position: (aContainer position + (step @ self class itemVerticalSpacing)).
		aContainer addMorph: item.
		self draggableItems add: item.
		step := step + self class itemSpace + SLGDraggableItemMorph slotExtent x]




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
	#'squeak_changestamp' : 'SW 7/11/2024 17:49'
}
SLGDragAndDropView >> createItemsAndTargets [
    
	| container correctAnswers answerSlots numAnswers space |
	container := Morph new
			bounds: (0@0 extent: self class taskElementWidth @ self class containerHeight); 
			color: Color transparent. 
			
	correctAnswers := self task correctAnswer.
	
	numAnswers := correctAnswers size.
	space := (container width /(numAnswers * 2 + 1))px.
	
	answerSlots := self createSlotsWith: correctAnswers.
	answerSlots center: container center - (SLGAnswerSlotMorph slotExtent x * 0.5 @ self class slotVerticalOffset).
	container addMorph: answerSlots.   
	
	self addShuffledOptionsWithin: container withPosition: space.
	
	^container
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:47'
}
SLGDragAndDropView >> createSlotsWith: correctAnswers [

	| container slot numAnswers step |
	container := Morph new.
	container color: Color transparent;
			extent: self class taskElementWidth @ self class slotHeight.

	numAnswers := correctAnswers size.
	step := (container width /(numAnswers * 2 + 1)) px.
	 
	correctAnswers do: [:correctAnswer |
		slot := SLGAnswerSlotMorph newWithLabel: correctAnswer.
		answerSlots add: slot.
		itemSlotMap at: slot put: nil.
		slot lock.
		slot position: step @ self class slotVerticalSpacing. 
		step := (step + self class slotSpace + SLGAnswerSlotMorph slotExtent x).
		container addMorph: slot. ].

	^container
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:49'
}
SLGDragAndDropView >> draggableItems: anOrderedCollection [
	draggableItems := anOrderedCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:12'
}
SLGDragAndDropView >> findTargetUnderCursor [

	| cursorPos |
	cursorPos := Sensor cursorPoint.
	
	^ self answerSlots detect: [:target | 
		target bounds containsPoint: cursorPos] 
		ifNone: [nil]
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 17:49'
}
SLGDragAndDropView >> initialize [

	super initialize.
	
	self draggableItems: OrderedCollection new.
	self answerSlots: OrderedCollection new.
	self itemSlotMap: OrderedDictionary new
	
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:03'
}
SLGDragAndDropView >> itemSlotMap: aDictionary [
	itemSlotMap := aDictionary
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 17:02'
}
SLGDragAndDropView >> passUserInput [

	| itemsAtSlots anAnswer targetCorrectMap |
	
	targetCorrectMap := OrderedDictionary new.
	itemsAtSlots := OrderedCollection new.
	self itemSlotMap keysAndValuesDo: [:slot :item |
		(item isKindOf: SLGDraggableItemMorph) ifTrue: [
			itemsAtSlots add: item label ].
		item ifNotNil: [
		targetCorrectMap at: slot put: (item label = slot label) ]].
	
	targetCorrectMap keysAndValuesDo: [:target :correct |
            target color: (correct 
			ifTrue: [SLGAbstractPage pastelGreen] 
			ifFalse: [self class pastelRed])].

	anAnswer := itemsAtSlots asArray.
	
	^ anAnswer
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:29'
}
SLGDragAndDropView >> setup [

	|interactive|
	
	interactive := self createItemsAndTargets.
	
	super setupWith: interactive

	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:50'
}
SLGDragAndDropView >> updateItemSlotMap: anItem atSlot: aSlot [

        self itemSlotMap at: aSlot put: anItem
]
