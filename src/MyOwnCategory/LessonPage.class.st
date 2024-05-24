Class {
	#name : #LessonPage,
	#superclass : #Page,
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 20:59'
}
LessonPage >> addTitle: aString [ 

        super addTitle: aString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:38'
}
LessonPage >> initialize [
 
	super initialize.
	self addBackButton
	

]
