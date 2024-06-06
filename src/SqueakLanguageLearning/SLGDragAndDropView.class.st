Class {
	#name : #SLGDragAndDropView,
	#superclass : #Morph,
	#instVars : [
		'dragAndDropTask',
		'submitButton',
		'draggableItems',
		'answerSlots',
		'itemSlotMap'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:30'
}
SLGDragAndDropView class >> newWithTask: aTask [

        ^ self new initializeWithTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 22:32'
}
SLGDragAndDropView class >> taskDescription [

	^ 'Drag the item to the correct gap.'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:16'
}
SLGDragAndDropView >> checkAnswer [

	| isValid itemsAtTarget anAnswer targetCorrectMap |
	
	targetCorrectMap := Dictionary new.	
	itemsAtTarget := OrderedCollection new.
	itemSlotMap keysAndValuesDo: [:target :item |
		(item isKindOf: DraggableItemMorph) ifTrue: [
			itemsAtTarget add: item label ].
		targetCorrectMap at: target put: (item label = target label) ].
	
	anAnswer := itemsAtTarget asArray.
	isValid := dragAndDropTask isAnswerCorrect: anAnswer.
	
	targetCorrectMap keysAndValuesDo: [:target :correct |
            target color: (correct ifTrue: [Color lightGreen] ifFalse: [Color red]).
        ].

	self inform: (isValid ifTrue: ['Correct!'] ifFalse: ['Incorrect, try again.']).
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 19:58'
}
SLGDragAndDropView >> createItemsAndTargets [
    
	| container xPosItem shuffledOptions correctAnswers answerSlots item "numAnswers step" |
	container := Morph new.
	container bounds: (0@0 extent: 900@500);
            color: Color white. 

	xPosItem := 100.

	shuffledOptions := dragAndDropTask getShuffledOptions.
	correctAnswers := dragAndDropTask correctAnswer.
	
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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:43'
}
SLGDragAndDropView >> highlightTarget [ 

        self color: Color yellow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:08'
}
SLGDragAndDropView >> initializeWithTask: aTask [
	|intercative |
        self initialize.
        dragAndDropTask := aTask.
        draggableItems := OrderedCollection new.
        answerSlots := OrderedCollection new.
        itemSlotMap := OrderedDictionary new.

	self setupLayout.
	self setupSubmitButton.
	intercative := self createItemsAndTargets.
	intercative position: (self position + (50 @ 100)).
	self addMorph: intercative.

	^ self
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/1/2024 23:08'
}
SLGDragAndDropView >> itemTargetMap [
	^ itemSlotMap
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/5/2024 19:58'
}
SLGDragAndDropView >> setupLayout [ 

        | taskLabel |
        self bounds: (0@0 extent: 1000@700);
            color: Color veryVeryLightGray; "TODO change back to white"
            center: World bounds center.
		"center: self owner."

	taskLabel := StringMorph contents: dragAndDropTask taskDescription.
	taskLabel
    		align: taskLabel topCenter
    		with: self topCenter.
	self addMorph: taskLabel
	
	
		
		
		
        
        
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 22:45'
}
SLGDragAndDropView >> setupSubmitButton [

    	| submitButton |
    	submitButton := SimpleButtonMorph new.
    	submitButton label: 'Submit'.
    	submitButton target: self.
    	submitButton actionSelector: #checkAnswer.
    	"submitButton position: (self position + (350@120))."
	submitButton
    		align: submitButton bottomCenter
    		with: self bottomCenter.
	self addMorph: submitButton
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:43'
}
SLGDragAndDropView >> unhighlightTarget [

        self color: Color gray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 23:08'
}
SLGDragAndDropView >> updateItemTargetMap: anItemMorph target: aTargetMorph [

        itemSlotMap at: aTargetMorph put: anItemMorph.
]
