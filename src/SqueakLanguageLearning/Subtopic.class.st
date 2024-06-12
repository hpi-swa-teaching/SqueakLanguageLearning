Class {
	#name : #Subtopic,
	#superclass : #Object,
	#instVars : [
		'title',
		'lessons'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:55'
}
Subtopic class >> newWithTitle: aTitle andLessons: lessonsList [

	^ self new initializeWithTitle: aTitle andLessons: lessonsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:29'
}
Subtopic class >> title: aTitle lessons: lessonsList [

	^ self new initializeWithTitle: aTitle andLessons: lessonsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:11'
}
Subtopic >> initializeWithTitle: aTitle andLessons: lessonsList [

	title := aTitle.
	lessons := lessonsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 16:32'
}
Subtopic >> isCompleted [

	lessons do: [ :each |
		(each isCompleted) ifFalse: [ ^false. ] ].
	
	^ true

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:10'
}
Subtopic >> lessons [
	^ lessons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:10'
}
Subtopic >> title [
	^ title
]
