Class {
	#name : #DataAccessService,
	#superclass : #Object,
	#instVars : [
		'topics'
	],
	#classVars : [
		'Instance'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 21:05'
}
DataAccessService >> createLessonsWithTasks: tasks fromIndex: aInteger1 toIndex: aInteger2 [

	|lessons task|
	lessons := OrderedCollection new.
	aInteger1 to: aInteger2 do: [:index | 
		task := tasks at: index.
		Transcript show: index.
		lessons add: (Lesson newWithDescription: 'LessonDescription', (index - aInteger1) asString andTask: task)].
	
	"lessons := Array new: (aInteger2 + 1 - aInteger1)."
	"1 to: (aInteger2 + 1 - aInteger1) do: [: index |
		task := tasks at: aInteger1.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
		aInteger1 := aInteger1 =1.
	]."

	^ lessons
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:23'
}
DataAccessService >> createSubtopicsForClasses [

| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).
	
	
	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 16:37'
}
DataAccessService >> createSubtopicsForControlFlow [

| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).
	
	
	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:22'
}
DataAccessService >> createSubtopicsForDataStructures [

| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).

	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 10:04'
}
DataAccessService >> createSubtopicsForDataTypes [

	| tasks subtopics|
	
	tasks := OrderedCollection new.
	
	tasks "assignment 2"
	add: (SLGDragAndDropTask newWithQuestion: 'Assign 5 to x.' withCode: '' withCorrectAnswer: #('x' ':' '=' '5'));
	add: (SLGDragAndDropTask newWithQuestion: 'Assign 6 to x and y.' withCode: '' withCorrectAnswer: #('x' ':=(1)' 'y' ':=(2)' '6' ));
	"integer 3"
	add: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: 'What is the value of w?' withCode: 'x := 2. \ny := -5.\nz := y / x. \nw := z // x' withOptions: #('5' 'x' '-2') withAnswers: #(false false true));
	add: (SLGSingleChoiceTask newSingleChoiceWithQuestion: '' withCode: 'x := 1. \n y := -5.\n x := x + 1. \n y := y * (x + y). \n z := y / x. \n w := z // x
' withOptions: #('y = 15' 'z = 7' 'w = 3.75') withAnswers: #(true false false)); 
	add: (SLGClozeTask newClozeWithQuestion: '' withCode: 'x := 1.\n x class. ' withCloze: 'The class of x is __.' withAnswer: 'The class of x is Integer.');
	"float 1"
	add: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: 'x := 1.99.\n y := 2.01.\n x floor.\n y ceiling.\n y rounded.\n z := x + y. 
' withOptions: #('x = 1' 'y = 3' 'z = 3') withAnswers: #(true false true));
	"string 2"
	add: (SLGClozeTask newClozeWithQuestion: '' withCode: 's := ''Hello Squeak''. \n Transcript show: s. "Hello again Squeak" \n s size.
' withCloze: 'The content shown in Transcript is __.' withAnswer: 'The content shown in Transcript is Hello Squeak.' );
	add: (SLGClozeTask newClozeWithQuestion: '' withCode: 's := ''Hello Squeak''. \n Transcript show: s. "Hello again Squeak" \n s size.
' withCloze: 'The size of s is __.' withAnswer: 'The size of s is 12.' );
	"bool 1"
	add: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: 'x := 1. y := 2. \n a := (x = y). \n b := x isInteger. \n b := b not.\n c := 123 isKindOf: Number' withOptions: #('a = True' 'b = false' 'c = true') withAnswers: #(false true true));
	"char 1"
	add: (SLGClozeTask newClozeWithQuestion: '' withCode: 'x := $A. \n y := x isUppercase.\n z := x asLowercase.' withCloze: 'The value of z is __.' withAnswer: 'The value of z is $a.');
	"symbol 2"
	add: (SLGSingleChoiceTask newSingleChoiceWithQuestion: '' withCode: 'symbol1 := #apple. \n symbol2 := #banana. \n symbol3 := #apple.
' withOptions: #('(symbol1 = symbol2)' '(symbol1 = symbol3)') withAnswers: #(false true));
	add: (SLGClozeTask newClozeWithQuestion: 'Complete the following command to make Transcript show ''Alice''.' withCode: 'dict := Dictionary new. \n dict at: #name put: ''Alice''. \n dict at: #age put: 30.\n dict at: #occupation put: ''Engineer''.' withCloze: 'Transcript show: (dict at: __).' withAnswer: 'Transcript show: (dict at: #name).');
	"nil 2"
	add: (SLGMultipleChoiceTask newMultipleChoiceWithQuestion: '' withCode: '' withOptions: #('nil is a special object that represents the absence of a value' 'It is an instance of the class UndefinedObject' 'nil indicates that a variable has not been assigned a value.') withAnswers: #(true true true));
	add: (SLGClozeTask newClozeWithQuestion: '' withCode: 'myVariable := nil. \n myVariable := myVariable ifNil: [ ''Default value'' ]. \n Transcript show: myVariable; cr. 
' withCloze: 'The Transcript shows __.' withAnswer: 'The Transcript shows ''Default value''.');
	"conversion 1"
	add: (SLGSingleChoiceTask newSingleChoiceWithQuestion: 'What is the value of x + y?' withCode: 'x := 3.99 asInteger. \n y := $A asciiValue. ' withOptions: #('69' '68' '69.99') withAnswers: #(false true false)).
	
	subtopics := Array new: 9.
	subtopics at: 1 put: (Subtopic newWithTitle: 'Assignment' andLessons: (self createLessonsWithTasks: tasks fromIndex: 1 toIndex: 2)).
subtopics at: 2 put: (Subtopic newWithTitle: 'Integer' andLessons: (self createLessonsWithTasks: tasks fromIndex: 3 toIndex: 5)).
subtopics at: 3 put: (Subtopic newWithTitle: 'Float' andLessons: (self createLessonsWithTasks: tasks fromIndex: 6 toIndex: 6)).
subtopics at: 4 put: (Subtopic newWithTitle: 'String' andLessons: (self createLessonsWithTasks: tasks fromIndex: 7 toIndex: 8)).
subtopics at: 5 put: (Subtopic newWithTitle: 'Boolean' andLessons: (self createLessonsWithTasks: tasks fromIndex: 9 toIndex: 9)).
subtopics at: 6 put: (Subtopic newWithTitle: 'Character' andLessons: (self createLessonsWithTasks: tasks fromIndex: 10 toIndex: 10)).
subtopics at: 7 put: (Subtopic newWithTitle: 'Symbol' andLessons: (self createLessonsWithTasks: tasks fromIndex: 11 toIndex: 12)).
subtopics at: 8 put: (Subtopic newWithTitle: 'Nil' andLessons: (self createLessonsWithTasks: tasks fromIndex: 13 toIndex: 14)).
subtopics at: 9 put: (Subtopic newWithTitle: 'Conversion' andLessons: (self createLessonsWithTasks: tasks fromIndex: 15 toIndex: 15)).


	"integerLessons := Array new: 10.
	3 to: 13 do: [:index |
		task := tasks at: index.
		assignmentLessons at: index put: (Lesson newWithDescription: 'LessonDescriptionDT', index asString andTask: task).
	].

	floatsLessons := Array new: 8.
	1 to: 5 do: [:index |
		task := tasks at: index.
		 at: index put: (Lesson newWithDescription: 'LessonDescriptionDT', index asString andTask: task).
	].	"
	
"	subtopicList := Dictionary new.
	subtopicList add: #Assignment -> 2 ; 
	add: #Integer -> 3; 
	add: #Float -> 1;
	add: #String -> 2;
	add: #Boolean -> 1;
	add: #Character -> 1;
	add: #Symbol -> 2;
	add: #Nil -> 2;
	add: #Conversion -> 1.
	
	index := 1.
	subtopics := OrderedCollection new.
	subtopicList keysAndValuesDo: [
		:subtopic :lessonNumber | 
		lessons := Array new: lessonNumber.
		[index to: (index + lessonNumber) do: [
				task := tasks at: index.
				lesson := Lesson newWithDescription: 'LessonDescription 1'  andTask: task.
				lessons add: lesson.
				index := index + 1.]
			].
		subtopics add: (Subtopic newWithTitle: subtopic asString andLessons: lessons).
		Transcript show: lessons size].
	"
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:24'
}
DataAccessService >> createSubtopicsForMethods [

| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).
	
	
	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:24'
}
DataAccessService >> createSubtopicsForMorphic [

	| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).
	
	
	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:25'
}
DataAccessService >> createSubtopicsForSqueak [

	| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (SLGDragAndDropTask newWithQuestion: 'Drag the correct answer to the corresponding gap' withCorrectAnswer: #('1' '2' '3' '4')).
	
	
	lessons := Array new: 2.
	"lessons at: 1 put: (Lesson newWithDescription: 'LessonDescription' andTask: (tasks at: 1))."
	1 to: 2 do: [:index |
		task := tasks at: index.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].
	
	subtopics := Array new: 3.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle1' andLessons: lessons).
	subtopics at: 2 put: (Subtopic newWithTitle: 'SubtopicTitle2' andLessons: lessons).
	subtopics at: 3 put: (Subtopic newWithTitle: 'SubtopicTitle3' andLessons: lessons).
	
	^subtopics
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/12/2024 09:08'
}
DataAccessService >> initialize [

	topics := Array new: 7.
	topics at: 1 put: (Topic newWithTitle: 'Data Types' Description: 'In Smalltalk, datatypes are the essential building blocks like numbers, strings, and booleans that form the foundation of all your programming adventures. Each datatype has unique properties and uses, making your code powerful and versatile. Ready to dive into datatypes? Let''s get started!' andSubtopics: self createSubtopicsForDataTypes).
	topics at: 2 put: (Topic newWithTitle: 'Control Flow' Description: 'Control flow in Smalltalk is your toolkit for directing the sequence of operations in your code. With loops, conditionals, and more, you can make your programs dynamic and responsive. Excited to take control? Let''s jump into control flow!' andSubtopics: self createSubtopicsForControlFlow).
	topics at: 3 put: (Topic newWithTitle: 'Data Structures' Description: 'Data structures in Smalltalk, such as arrays, dictionaries, and sets, are your secret weapons for organizing and managing data efficiently. They help you structure your programs for better performance and readability. Ready to conquer data structures? Let''s dive in!' andSubtopics: self createSubtopicsForDataStructures).
	topics at: 4 put: (Topic newWithTitle: 'Classes' Description: 'Classes are the heart and soul of Smalltalk, defining the blueprints for creating objects. They encapsulate data and behavior, bringing your ideas to life in code. Ready to craft some classes? Let''s get started!' andSubtopics: self createSubtopicsForClasses).
	topics at: 5 put: (Topic newWithTitle: 'Methods' Description: 'Methods are the dynamic performers in Smalltalk, defining the actions that objects can take. They allow you to add functionality and bring your objects to life. Ready to write some methods? Let''s begin the journey!' andSubtopics: self createSubtopicsForMethods).
	topics at: 6 put: (Topic newWithTitle: 'Morphic' Description: 'Morphic is the vibrant, graphical framework in Smalltalk, perfect for creating interactive user interfaces. It lets you build and manipulate graphical objects with ease, making your applications visually stunning. Ready to explore Morphic? Let''s dive into the magic!' andSubtopics: self createSubtopicsForMorphic).
	topics at: 7 put: (Topic newWithTitle: 'Squeak Walkthrough' Description: 'Squeak is the dynamic, open-source Smalltalk programming environment that empowers you to create, explore, and innovate. With its rich set of tools and libraries, Squeak opens up endless possibilities for your programming journey. Excited to explore Squeak? Let''s jump right in!' andSubtopics: self createSubtopicsForSqueak).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
DataAccessService >> topics [
	^ topics
]
