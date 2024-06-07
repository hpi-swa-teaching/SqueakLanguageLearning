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
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 6/6/2024 15:57'
}
SLGDragAndDropView class >> newWithTask: aSLGDragAndDropTask [

	^ self new
		task: aSLGDragAndDropTask;
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
	#'squeak_changestamp' : 'SW 6/7/2024 10:52'
}
SLGDragAndDropView >> createItemsAndTargets [
    
	| container xPosItem shuffledOptions correctAnswers answerSlots item "numAnswers step" |
	container := Morph new.
	container bounds: "(0@0 extent: 900@500);" (0@0 extent: 500@500);
            "color: Color white."
		color: Color transparent. 

	xPosItem := 100.

	shuffledOptions := self task getShuffledOptions.
	correctAnswers := self task correctAnswer.
	
	answerSlots := self createSlotsWith: correctAnswers.
	answerSlots position: (container position + (0 @ 50)).
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
	#'squeak_changestamp' : 'EB 6/1/2024 23:14'
}
SLGDragAndDropView >> createSlotsWith: correctAnswers [

	| container slot numAnswers step |
	container := Morph new.
	container color: Color transparent; 
	extent: 900 @ 150. "TODO change the size of a container"

	numAnswers := correctAnswers size.
	step := container width / (numAnswers * 2 + 1).
	 
	correctAnswers do: [:correctAnswer |
		"slot := Morph new."
		"slot label: correctAnswer."
		slot := AnswerSlotMorph newWithLabel: correctAnswer.
		answerSlots add: slot.
		slot lock.
		"slot color: Color lightGray;
			extent: 150 @ 100;
			borderWidth: 2;
			borderColor: Color black;
			lock."

	slot position: container position + (step @ 100).
	step := (step + 200). "TODO should be calculated"
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
	#category : #setup,
	#'squeak_changestamp' : 'EB 5/22/2024 21:43'
}
SLGDragAndDropView >> highlightTarget [ 

        self color: Color yellow.
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
	#'squeak_changestamp' : 'SW 6/6/2024 15:55'
}
SLGDragAndDropView >> itemSlotMap: anObject [
	itemSlotMap := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/1/2024 23:08'
}
SLGDragAndDropView >> itemTargetMap [
	^ itemSlotMap
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 11:06'
}
SLGDragAndDropView >> setup [

	|intercative |

	super setup.
	
	intercative := self createItemsAndTargets.
	intercative position: (self position + (50 @ 100)).
	self addMorph: intercative.

	"^ self"
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 5/22/2024 21:43'
}
SLGDragAndDropView >> unhighlightTarget [

        self color: Color gray.
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 6/1/2024 23:08'
}
SLGDragAndDropView >> updateItemTargetMap: anItemMorph target: aTargetMorph [

        itemSlotMap at: aTargetMorph put: anItemMorph.
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 10:36'
}
SLGDragAndDropView >> validate [

	| itemsAtTarget anAnswer targetCorrectMap |
	
	targetCorrectMap := Dictionary new.	
	itemsAtTarget := OrderedCollection new.
	itemSlotMap keysAndValuesDo: [:target :item |
		(item isKindOf: DraggableItemMorph) ifTrue: [
			itemsAtTarget add: item label ].
		targetCorrectMap at: target put: (item label = target label) ].
	
	targetCorrectMap keysAndValuesDo: [:target :correct |
            target color: (correct ifTrue: [Color lightGreen] ifFalse: [Color red]).
        ].

	anAnswer := itemsAtTarget asArray.
	
	(self task validate: anAnswer)
		ifTrue: [self printSuccess]
		ifFalse: [self printFailure].

	"self inform: (isValid ifTrue: ['Correct!'] ifFalse: ['Incorrect, try again.'])."
		
]
