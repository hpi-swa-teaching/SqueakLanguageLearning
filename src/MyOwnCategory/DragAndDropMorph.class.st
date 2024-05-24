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
	#'squeak_changestamp' : 'EB 5/23/2024 12:27'
}
DragAndDropMorph >> createItemsAndTargets [
    | yPosTarget yPosItem xPosTarget xPosItem shuffledOptions correctAnswers |
    yPosTarget := 200.
    yPosItem := 400.
    xPosTarget := 10.
    xPosItem := 100.
    shuffledOptions := dragAndDropTask getShuffledOptions.
    correctAnswers := dragAndDropTask getCorrectAnswer.

    correctAnswers do: [:correctAnswer |
        | target |
        target := self createTargetWithLabel: correctAnswer.
        "target position: xPosTarget @ yPosTarget."
	target position: (self position + (xPosTarget@80)).
        self addMorph: target.
        targetMorphs add: target.

        "xPosTarget := xPosTarget + target width + 20."
	xPosTarget := xPosTarget + 90.
    ].

    shuffledOptions do: [:option |
        | item |
        item := DraggableItemMorph newWithLabel: option inMorph: self.
        item position: xPosItem @ yPosItem.
        self addMorph: item.
        itemMorphs add: item.

        xPosItem := xPosItem + item width + 20.
    ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 12:01'
}
DragAndDropMorph >> createTargetWithLabel: aString [

    | targetMorph labelMorph |
    targetMorph := Morph new.
    labelMorph := StringMorph contents: aString.
    labelMorph visible: false. "Hide the answer"
    targetMorph addMorph: labelMorph.

	^ targetMorph
	

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
	#'squeak_changestamp' : 'EB 5/23/2024 12:19'
}
DragAndDropMorph >> initializeWithTask: aTask [

        self initialize.
        dragAndDropTask := aTask.
        itemMorphs := OrderedCollection new.
        targetMorphs := OrderedCollection new.
        itemTargetMap := Dictionary new.

        self setupLayout.
        self setupSubmitButton.
        self createItemsAndTargets.

	^ self
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/24/2024 00:07'
}
DragAndDropMorph >> isAnswerCorrect [

	"| isValid anAnswer |
	itemTargetMap keysAndValuesDo: [:item :target |
		isValid := (item label = target label).
		isValid := dragAndDropTask isAnswerCorrect: anAnswer.
  	      target color: (isValid ifTrue: [Color lightGreen] ifFalse: [Color red]).
	]"

	| isValid |
isValid := true.

itemTargetMap keysAndValuesDo: [:target :item |
    | itemsAtTarget anAnswer |
    itemsAtTarget := OrderedCollection new.
    itemsAtTarget add: item label.  "Add the label of the current item to itemsAtTarget"
    Transcript show: 'Items at Target: ', itemsAtTarget asString; cr. "Print itemsAtTarget to Transcript"
    anAnswer := itemsAtTarget asArray.
    isValid := isValid and: (dragAndDropTask isAnswerCorrect: anAnswer).
].

self inform: (isValid ifTrue: ['Correct!'] ifFalse: ['Incorrect, try again.']).
	
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
