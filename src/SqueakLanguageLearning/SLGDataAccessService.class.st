Class {
	#name : #SLGDataAccessService,
	#superclass : #Object,
	#instVars : [
		'topics'
	],
	#classVars : [
		'Instance'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 14:37'
}
SLGDataAccessService >> createSubtopicsForClasses [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		"with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_01') ) 
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_02') )"
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4' '5' '6') withID:'slg1_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		"with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_04') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_05') )"
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		"with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_07') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_08') )"
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 21:10'
}
SLGDataAccessService >> createSubtopicsForControlFlow [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('Conditional Expressions' 'Iteration' 'Block (Closure)').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg2_01') ) 
		with: (SLGLesson newWithTask: ( SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the right result value of a from following code?' withCode: '| a b |\na := 1.\nb := 2.\ntrue or: [a := b. true].' withOptions: #('1' '2' '3') withAnswers: #(true false false) withID:'slg2_02') )
		with: (SLGLesson newWithTask: ( SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the right result value of a from following code?' withCode: '| a b |\na := 1.\nb := 2.\nfalse or: [a := b. true].' withOptions: #('1' '2' '3') withAnswers: #(false true false) withID:'slg2_03') )
		with: (SLGLesson newWithTask: ( SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the result value of the following code?' withCode: '| colors |\ncolors := {Color white . Color yellow. Color red . Color blue . Color orange}.\ncolors includes: Color blue. ' withOptions: #('true' 'false') withAnswers: #(true false) withID:'slg2_04') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg2_05') )
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'The result value of both statements are the same?' withCode: '10 timesRepeat: [y := y * 2].\n1 to: 10 do: [:a | y := y * 2].' withOptions: #('true' 'false') withAnswers: #(true false) withID:'slg2_06') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg2_07') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Please select all the correct explanation about Block on Squeak' withOptions: #('Blocks are not lexical closures' 'A block is essentially an anonymous(Lambda) function' 'Blocks may take parameters' 'Blocks can not declare temporary variables') withAnswers: #(false true true false) withID:'slg2_08') )
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Which one is correctly written?' withOptions: #('[:x :y | |z| z:= x + y. z] value:1 value:2' '[x: y: | z;  z:= x + y. z] value:1 value:2') withAnswers: #(true false) withID:'slg2_09') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg2_10') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 21:16'
}
SLGDataAccessService >> createSubtopicsForDataStructures [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('Array' 'Ordered Collection' 'Dictionary').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_01' ) ) 
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_02') )
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_04') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_05') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_07') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_08') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg3_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:02'
}
SLGDataAccessService >> createSubtopicsForDataTypes [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('Assignment' 'Integer' 'Float' 'String' 'Boolean' 'Character' 'Symbol' 'Nil' 'Conversion').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Assign 5 to x.' withCode: '' withCorrectAnswer: #('x' ':' '=' '5') withID: 'slg4_01') )  
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Copy object of x into y.' withCode: '' withCorrectAnswer: #('y' ':=' 'x' 'copy') withID: 'slg4_02') ) ).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the value of x?' withCode: 'x := 1 + 2 * 3' withOptions: #('7' '9') withAnswers: #(false true) withID: 'slg4_03') )
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: '' withCode: 'x := 1. \n y := -5.\n x := x + 1. \n z := y // x' withOptions: #('z = -3' 'z = -2.5' 'z = -2') withAnswers: #(true false false) withID: 'slg4_04') )
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: '' withCode: 'x := 1.\n x class. ' withCloze: 'The class of x is __.' withAnswer: 'The class of x is Integer.' withID: 'slg4_05') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: 'x := 1.99.\n y := 2.01.\n x floor.\n y ceiling.\n y rounded.\n z := x + y.' withOptions: #('x = 1' 'y = 3' 'z = 3') withAnswers: #(true false true) withID: 'slg4_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 4) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: '' withCode: 's := ''Hello Squeak''. \n Transcript show: s. "Hello again Squeak" \n s size.' withCloze: 'The content shown in Transcript is __.' withAnswer: 'The content shown in Transcript is Hello Squeak.' withID: 'slg4_07') )
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: '' withCode: 's := ''Hello Squeak''. \n Transcript show: s. "Hello again Squeak" \n s size.' withCloze: 'The size of s is __.' withAnswer: 'The size of s is 12.' withID: 'slg4_08') )).
		
		lessonsForSubtopic at: (listOfSubtopics at: 5) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: 'x := 1. y := 2. \n a := (x = y). \n b := x isInteger. \n b := b not.\n c := 123 isKindOf: Number' withOptions: #('a = True' 'b = false' 'c = true') withAnswers: #(false true true) withID: 'slg4_09') )).
		
		lessonsForSubtopic at: (listOfSubtopics at: 6) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: '' withCode: 'x := $A. \n y := x isUppercase.\n z := x asLowercase.' withCloze: 'The value of z is __.' withAnswer: 'The value of z is $a.' withID: 'slg4_10') )).
		
		lessonsForSubtopic at: (listOfSubtopics at: 7) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: '' withCode: 'symbol1 := #apple. \n symbol2 := #banana. \n symbol3 := #apple.' withOptions: #('(symbol1 = symbol2)' '(symbol1 = symbol3)') withAnswers: #(false true) withID: 'slg4_11') )
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: 'Complete the following command to make Transcript show ''Alice''.' withCode: 'dict := Dictionary new. \n dict at: #name put: ''Alice''. \n dict at: #age put: 30.\n dict at: #occupation put: ''Engineer''.' withCloze: 'Transcript show: (dict at: __).' withAnswer: 'Transcript show: (dict at: #name).' withID: 'slg4_12') )).
		
		lessonsForSubtopic at: (listOfSubtopics at: 8) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: '' withOptions: #('nil is a special object that represents the absence of a value' 'It is an instance of the class UndefinedObject' 'nil indicates that a variable has not been assigned a value.') withAnswers: #(true true true) withID: 'slg4_13') )
		with: (SLGLesson newWithTask: (SLGClozeTask newClozeWithQuestion: '' withCode: 'myVariable := nil. \n myVariable := myVariable ifNil: [ ''Default value'' ]. \n Transcript show: myVariable; cr. ' withCloze: 'The Transcript shows __.' withAnswer: 'The Transcript shows ''Default value''.' withID: 'slg4_14') )).
		
		lessonsForSubtopic at: (listOfSubtopics at: 9) put: (OrderedCollection
		with: (SLGLesson newWithTask: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the value of x + y?' withCode: 'x := 3.99 asInteger. \n y := $A asciiValue. ' withOptions: #('69' '68' '69.99') withAnswers: #(false true false) withID: 'slg4_15') )).


	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 17:12'
}
SLGDataAccessService >> createSubtopicsForMethods [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_01') ) 
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_02') )
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_04') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_05') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_07') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_08') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg5_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 17:12'
}
SLGDataAccessService >> createSubtopicsForMorphic [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_01') ) 
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_02') )
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_04') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_05') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_07') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_08') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg6_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 17:13'
}
SLGDataAccessService >> createSubtopicsForSqueak [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_01') ) 
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_02') )
		with: (SLGLesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_04') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_05') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_07') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_08') )
		with: (SLGLesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID: 'slg7_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (SLGSubtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 17:13'
}
SLGDataAccessService >> initialize [

	topics := Array new: 7.
	topics at: 1 put: (SLGTopic newWithTitle: 'Data Types' Description: 'In Smalltalk, datatypes are the essential building blocks like numbers, strings, and booleans that form the foundation of all your programming adventures. Each datatype has unique properties and uses, making your code powerful and versatile. Ready to dive into datatypes? Let’s get started!' andSubtopics: self createSubtopicsForDataTypes).
	topics at: 2 put: (SLGTopic newWithTitle: 'Control Flow' Description: 'Control flow in Smalltalk is your toolkit for directing the sequence of operations in your code. With loops, conditionals, and more, you can make your programs dynamic and responsive. Excited to take control? Let’s jump into control flow!' andSubtopics: self createSubtopicsForControlFlow).
	topics at: 3 put: (SLGTopic newWithTitle: 'Data Structures' Description: 'Data structures in Smalltalk, such as arrays, dictionaries, and sets, are your secret weapons for organizing and managing data efficiently. They help you structure your programs for better performance and readability. Ready to conquer data structures? Let’s dive in!' andSubtopics: self createSubtopicsForDataStructures).
	topics at: 4 put: (SLGTopic newWithTitle: 'Classes' Description: 'Classes are the heart and soul of Smalltalk, defining the blueprints for creating objects. They encapsulate data and behavior, bringing your ideas to life in code. Ready to craft some classes? Let’s get started!' andSubtopics: self createSubtopicsForClasses).
	topics at: 5 put: (SLGTopic newWithTitle: 'Methods' Description: 'Methods are the dynamic performers in Smalltalk, defining the actions that objects can take. They allow you to add functionality and bring your objects to life. Ready to write some methods? Let’s begin the journey!' andSubtopics: self createSubtopicsForMethods).
	topics at: 6 put: (SLGTopic newWithTitle: 'Morphic' Description: 'Morphic is the vibrant, graphical framework in Smalltalk, perfect for creating interactive user interfaces. It lets you build and manipulate graphical objects with ease, making your applications visually stunning. Ready to explore Morphic? Let’s dive into the magic!' andSubtopics: self createSubtopicsForMorphic).
	topics at: 7 put: (SLGTopic newWithTitle: 'Squeak Walkthrough' Description: 'Squeak is the dynamic, open-source Smalltalk programming environment that empowers you to create, explore, and innovate. With its rich set of tools and libraries, Squeak opens up endless possibilities for your programming journey. Excited to explore Squeak? Let’s jump right in!' andSubtopics: self createSubtopicsForSqueak).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
SLGDataAccessService >> topics [
	^ topics
]
