Class {
	#name : #DragAndDropMorph,
	#superclass : #Morph,
	#instVars : [
		'dragAndDropTask',
		'itemMorphs',
		'targetMorphs',
		'itemTargetMap',
		'submitButton'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:30'
}
DragAndDropMorph class >> newWithTask: aTask [

        ^ self new initializeWithTask: aTask
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/24/2024 22:24'
}
DragAndDropMorph >> createItemsAndTargets [
    
	| xPosTarget xPosItem shuffledOptions correctAnswers |
	xPosTarget := 100.
	xPosItem := 100.
	shuffledOptions := dragAndDropTask getShuffledOptions.
	correctAnswers := dragAndDropTask getCorrectAnswer.

    correctAnswers do: [:correctAnswer |
        | target |
	target := self createTargetWithLabel: correctAnswer.
	"target := DraggableItemMorph newWithLabel: correctAnswer inMorph: self."
	target position: (self position + (xPosTarget@180)).
        self addMorph: target.
        targetMorphs add: target.

	xPosTarget := xPosTarget + 90.
    ].

    shuffledOptions do: [:option |
        | item |
        item := DraggableItemMorph newWithLabel: option inMorph: self.
        item position: (self position + (xPosItem@280)).
        self addMorph: item.
        itemMorphs add: item.

        xPosItem := xPosItem + 90.
    ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/24/2024 21:36'
}
DragAndDropMorph >> createTargetWithLabel: aString [

    | targetMorph labelMorph |
    "targetMorph := Morph new.
    labelMorph := StringMorph contents: aString.
    labelMorph visible: false.
    targetMorph addMorph: labelMorph."

	"item := DraggableItemMorph newWithLabel: option inMorph: self."
	
	targetMorph := DraggableItemMorph newWithLabel:aString inMorph: self.
	labelMorph := StringMorph contents: aString.
	labelMorph visible: false.
	targetMorph addMorph: labelMorph.

	^ targetMorph
	"^ {targetMorph. labelMorph}"
	
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:33'
}
DragAndDropMorph >> findTargetUnderCursor [

        | cursorPos |
        cursorPos := Sensor cursorPoint.
        ^ targetMorphs detect: [:target | target bounds containsPoint: cursorPos] ifNone: [nil]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:43'
}
DragAndDropMorph >> highlightTarget [ 

        self color: Color yellow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/24/2024 22:35'
}
DragAndDropMorph >> initializeWithTask: aTask [

        self initialize.
        dragAndDropTask := aTask.
        itemMorphs := OrderedCollection new.
        targetMorphs := OrderedCollection new.
        itemTargetMap := OrderedDictionary new.

        self setupLayout.
        self setupSubmitButton.
        self createItemsAndTargets.

	^ self
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/24/2024 22:26'
}
DragAndDropMorph >> isAnswerCorrect [

	| isValid itemsAtTarget anAnswer |
	isValid := true.
	
	Transcript show: 'ItemTargetMap: '.
	itemTargetMap keysAndValuesDo: [:key :value | Transcript show: key; show: ': '; show: value; cr. ].
	
	itemsAtTarget := OrderedCollection new.
	itemTargetMap keysAndValuesDo: [:target :item |
		Transcript show: 'Checking target: ', target asString, ' with item: ', item asString; cr.
		(item isKindOf: DraggableItemMorph) ifTrue: [
			Transcript show: 'Item label: ', item label asString; cr.
			Transcript show: 'Target label: ', target label asString; cr.
			itemsAtTarget add: item label.
			Transcript show: itemsAtTarget; cr.
		].
	].
	
	anAnswer := itemsAtTarget asArray.  
	Transcript show: anAnswer; cr.
	isValid := isValid and: (dragAndDropTask isAnswerCorrect: anAnswer).

	self inform: (isValid ifTrue: ['Correct!'] ifFalse: ['Incorrect, try again.']).
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/24/2024 21:02'
}
DragAndDropMorph >> itemTargetMap [
	^ itemTargetMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/24/2024 21:02'
}
DragAndDropMorph >> itemTargetMap: anObject [
	itemTargetMap := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:34'
}
DragAndDropMorph >> setupLayout [ 

        | taskLabel |
        self bounds: (0@0 extent: 1200@900);
            color: Color white;
            center: World bounds center.

	taskLabel := StringMorph contents: dragAndDropTask getTaskDescription.
	taskLabel
    		align: taskLabel topCenter
    		with: self topCenter.
	self addMorph: taskLabel
	
	
		
		
		
        
        
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:35'
}
DragAndDropMorph >> setupSubmitButton [

    	| submitButton |
    	submitButton := SimpleButtonMorph new.
    	submitButton label: 'Submit'.
    	submitButton target: self.
    	submitButton actionSelector: #isAnswerCorrect.
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
DragAndDropMorph >> unhighlightTarget [

        self color: Color gray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/22/2024 21:25'
}
DragAndDropMorph >> updateItemTargetMap: anItemMorph target: aTargetMorph [

        itemTargetMap at: anItemMorph put: aTargetMorph.
]
