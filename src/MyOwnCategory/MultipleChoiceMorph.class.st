Class {
	#name : #MultipleChoiceMorph,
	#superclass : #Morph,
	#instVars : [
		'multipleChoiceTask',
		'answers'
	],
	#category : #'MyOwnCategory-Tasks'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 23:05'
}
MultipleChoiceMorph class >> newWithTask: aTask [

        ^ self new initializeWithTask: aTask.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 22:45'
}
MultipleChoiceMorph >> checkAnswer [

	| isValid |	
		
	isValid := multipleChoiceTask isAnswerCorrect: answers.

	"self inform: (isValid ifTrue: ['Correct!'] ifFalse: ['Incorrect, try again.'])."
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/30/2024 17:41'
}
MultipleChoiceMorph >> createTogglesWithAnswerOptions: answerOptions [

	| container yPos |
	container := Morph new.
	container position: (self position);
            color: Color white.
	
	yPos := 120.
	answerOptions do: [:option |
		| toggle toggleDescription |
		toggle := SLGToggleButton newToggleButtonWithState: false withPosition: (self position + (50@yPos)).

		toggleDescription := StringMorph contents: option.
		toggleDescription position: (toggle position + (toggle width + 20 @ 0)).
		
		container addMorph: toggle.
		container addMorph: toggleDescription.
		yPos := yPos + 100.
	].
	
	self addMorph: container.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/29/2024 23:47'
}
MultipleChoiceMorph >> initializeWithTask: aTask [
	
	| taskLabel |
	super initialize.
	multipleChoiceTask := aTask.
	self bounds: (0@0 extent: 1000@600);
            color: Color white;
            center: World bounds center.
	
	taskLabel := StringMorph contents: aTask taskDescription.
	taskLabel
    		align: taskLabel topCenter
    		with: self topCenter.
	self addMorph: taskLabel.
	
	self createTogglesWithAnswerOptions: multipleChoiceTask answerOptions.
	
]
