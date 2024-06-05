Class {
	#name : #DataAccessService,
	#superclass : #Object,
	#instVars : [
		'topics'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:21'
}
DataAccessService class >> new [

	^super new initialize
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/1/2024 19:10'
}
DataAccessService >> createSubtopicsForClasses [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 19:10'
}
DataAccessService >> createSubtopicsForControlFlow [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 23:23'
}
DataAccessService >> createSubtopicsForDataStructures [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 23:23'
}
DataAccessService >> createSubtopicsForDataTypes [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Assign 5 to x' correctAnswer: #('x' ':' '=' '5')).
	tasks at: 2 put: (DragAndDropTask task: 'Assign 6 to x and y' correctAnswer: #('x' ':=(1)' 'y' ':=(2)' '6' )).
	
	lessons := Array new: 2.
	1 to: 2 do: [:index |
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
	#'squeak_changestamp' : 'EB 6/1/2024 19:09'
}
DataAccessService >> createSubtopicsForMethods [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 19:09'
}
DataAccessService >> createSubtopicsForMorphic [

	| tasks task lessons subtopics |
	
	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 19:09'
}
DataAccessService >> createSubtopicsForSqueak [

	| tasks task lessons subtopics |

	tasks := Array new: 2.
	tasks at: 1 put: (DragAndDropTask task: 'Drag the correct answer to the corresponding gap' correctAnswer: #('1' '2' '3' '4' '5')).
	tasks at: 2 put: (MultipleChoiceTask task: 'Do you like Squeak?' answerOptions: #('Yes' 'No' 'Dont know') correctAnswers: #(true, true, false)).
	
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
	#'squeak_changestamp' : 'EB 6/1/2024 19:12'
}
DataAccessService >> initialize [

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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 15:52'
}
DataAccessService >> readFileAsCollection: fileName [

	| contents linesArray |
	contents := self readFromFile: fileName.
	contents ifNotNil: [
            "Split contents into lines"
            linesArray := contents findTokens: ','.
            ^ linesArray.
	] ifNil: [ ^ nil ]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 00:07'
}
DataAccessService >> readFromFile: fileName [
	
	| fileStream contents |
	fileStream := StandardFileStream readOnlyFileNamed: fileName.
	fileStream ifNotNil: [
		contents := fileStream contentsOfEntireFile.
		fileStream close.
		^contents
	] ifNil: [
    		Transcript show: 'File does not exist.'; cr.
	]
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
DataAccessService >> topics [
	^ topics
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:38'
}
DataAccessService >> writeToFile: filePath contents: contentString [

        | fileStream |
        [
            fileStream := FileStream newFileNamed: filePath.
            fileStream isNil ifTrue: [^self error: 'Cannot open file'].
            fileStream nextPutAll: contentString.
            fileStream close.
        ] on: Error do: [:ex | 
            Transcript show: 'An error occurred while writing to file: ', ex messageText; cr.
            ^self error: 'Cannot open file'].
]
