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
	#'squeak_changestamp' : 'EB 6/12/2024 15:15'
}
SLGDataAccessService >> createSubtopicsForClasses [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_01') ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_02') )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_03') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_04') )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_05') )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_06') )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_07') )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_08') )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg1_09') )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 15:54'
}
SLGDataAccessService >> createSubtopicsForControlFlow [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') withID:'slg2_01') ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:57'
}
SLGDataAccessService >> createSubtopicsForDataStructures [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/10/2024 10:03'
}
SLGDataAccessService >> createSubtopicsForDataTypes [

	| tasks task lessons subtopics |
	
	tasks := Array new: 5.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Assign 5 to x' withCorrectAnswer: #('x' ':' '=' '5')).
	tasks at: 2 put: (SLGDragAndDropTask newWithQuestion: 'Assign 6 to x and y' withCorrectAnswer: #('x' ':=(1)' 'y' ':=(2)' '6' )).
	tasks at: 3 put: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'Do you like Squeak?' withOptions: #('yes' 'no' 'maybe') withAnswers: #(true true false)).
	tasks at: 4 put: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'Do you like Squeak?' withOptions: #('yes' 'no' 'maybe') withAnswers: #(true false false)).
	tasks at: 5 put: (SLGClozeTask newClozeWithQuestion: nil withCloze: 'a_lozeString' withAnswer: 'aClozeString').
	
	lessons := Array new: 5.
	1 to: 5 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescriptionDT', index asString andTask: task).
	].

	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'Assignment' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'Integers' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'Floats' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:56'
}
SLGDataAccessService >> createSubtopicsForMethods [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:57'
}
SLGDataAccessService >> createSubtopicsForMorphic [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/11/2024 22:57'
}
SLGDataAccessService >> createSubtopicsForSqueak [

	| listOfSubtopics subtopics lessonsForSubtopic title |
	
	listOfSubtopics := OrderedCollection withAll: #('SubtopicTitle1' 'SubtopicTitle2' 'SubtopicTitle3').
	
	lessonsForSubtopic := Dictionary new.
	lessonsForSubtopic at: (listOfSubtopics at: 1) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) ) 
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4') ) )
		with: (Lesson newWithTask: ( SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 2) put: ( OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
		
	lessonsForSubtopic at: (listOfSubtopics at: 3) put: (OrderedCollection 
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )
		with: (Lesson newWithTask: (SLGDragAndDropTask newWithQuestion: 'Put the elements in the ascending order.' withCorrectAnswer: #('1' '2' '3' '4')) )).
	
	
	subtopics := OrderedCollection new.
	1 to: listOfSubtopics size do: [:index |
		title := listOfSubtopics at: index.
		subtopics add: (Subtopic newWithTitle: title andLessons: (lessonsForSubtopic at: title)) ].
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 19:12'
}
SLGDataAccessService >> initialize [

	topics := Array new: 7.
	topics at: 1 put: (Topic newWithTitle: 'Data Types' Description: 'In Smalltalk, datatypes are the essential building blocks like numbers, strings, and booleans that form the foundation of all your programming adventures. Each datatype has unique properties and uses, making your code powerful and versatile. Ready to dive into datatypes? Let’s get started!' andSubtopics: self createSubtopicsForDataTypes).
	topics at: 2 put: (Topic newWithTitle: 'Control Flow' Description: 'Control flow in Smalltalk is your toolkit for directing the sequence of operations in your code. With loops, conditionals, and more, you can make your programs dynamic and responsive. Excited to take control? Let’s jump into control flow!' andSubtopics: self createSubtopicsForControlFlow).
	topics at: 3 put: (Topic newWithTitle: 'Data Structures' Description: 'Data structures in Smalltalk, such as arrays, dictionaries, and sets, are your secret weapons for organizing and managing data efficiently. They help you structure your programs for better performance and readability. Ready to conquer data structures? Let’s dive in!' andSubtopics: self createSubtopicsForDataStructures).
	topics at: 4 put: (Topic newWithTitle: 'Classes' Description: 'Classes are the heart and soul of Smalltalk, defining the blueprints for creating objects. They encapsulate data and behavior, bringing your ideas to life in code. Ready to craft some classes? Let’s get started!' andSubtopics: self createSubtopicsForClasses).
	topics at: 5 put: (Topic newWithTitle: 'Methods' Description: 'Methods are the dynamic performers in Smalltalk, defining the actions that objects can take. They allow you to add functionality and bring your objects to life. Ready to write some methods? Let’s begin the journey!' andSubtopics: self createSubtopicsForMethods).
	topics at: 6 put: (Topic newWithTitle: 'Morphic' Description: 'Morphic is the vibrant, graphical framework in Smalltalk, perfect for creating interactive user interfaces. It lets you build and manipulate graphical objects with ease, making your applications visually stunning. Ready to explore Morphic? Let’s dive into the magic!' andSubtopics: self createSubtopicsForMorphic).
	topics at: 7 put: (Topic newWithTitle: 'Squeak Walkthrough' Description: 'Squeak is the dynamic, open-source Smalltalk programming environment that empowers you to create, explore, and innovate. With its rich set of tools and libraries, Squeak opens up endless possibilities for your programming journey. Excited to explore Squeak? Let’s jump right in!' andSubtopics: self createSubtopicsForSqueak).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
SLGDataAccessService >> topics [
	^ topics
]
