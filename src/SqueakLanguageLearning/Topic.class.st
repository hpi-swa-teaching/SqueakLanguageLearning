Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'subtopics'
	],
	#category : #'SqueakLanguageLearning-Data'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:58'
}
Topic class >> newWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:32'
}
Topic class >> title: aTitle description: aDescription subtopics: subtopicsList [

	^ self new initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
Topic >> description [
	^ description
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 21:31'
}
Topic >> initializeWithTitle: aTitle Description: aDescription andSubtopics: subtopicsList [

	title := aTitle.
	description := aDescription.
	subtopics := subtopicsList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:08'
}
Topic >> subtopics [
	^ subtopics
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 21:07'
}
Topic >> title [
	^ title
]
