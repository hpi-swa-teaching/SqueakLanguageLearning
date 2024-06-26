"
Data structure that manages the progress of a user through various tasks or modules; provides methods to record, update, and retrieve progress information.
"
Class {
	#name : #SLGUserProgress,
	#superclass : #Object,
	#instVars : [
		'completed',
		'score',
		'topicScore',
		'subtopicScore'
	],
	#classVars : [
		'Instance'
	],
	#category : #'SqueakLanguageLearning-Data',
	#'squeak_changestamp' : 'EB 6/26/2024 15:43'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/11/2024 13:46'
}
SLGUserProgress class >> reset [

		Instance := nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/11/2024 13:50'
}
SLGUserProgress class >> userData [
	^ Instance
		ifNil: [Instance := self new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 13:51'
}
SLGUserProgress >> completed [
	^ completed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 13:51'
}
SLGUserProgress >> completed: anObject [
	completed := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 19:33'
}
SLGUserProgress >> initialize [

	completed := Set new.
	score := 0.
	topicScore := 0.
	subtopicScore := 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:02'
}
SLGUserProgress >> markTaskAsCompleted: aTaskID [

        (completed includes: aTaskID) ifFalse: [ 
			completed add: aTaskID. 
			self updateScore. ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 19:52'
}
SLGUserProgress >> score [
	^ score
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 19:52'
}
SLGUserProgress >> score: anObject [
	score := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 20:06'
}
SLGUserProgress >> subtopicScore [
	^ subtopicScore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 20:06'
}
SLGUserProgress >> subtopicScore: anObject [
	subtopicScore := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 20:11'
}
SLGUserProgress >> topicScore [
	^ topicScore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/14/2024 20:11'
}
SLGUserProgress >> topicScore: anObject [
	topicScore := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:02'
}
SLGUserProgress >> updateScore [
	
	score := (completed size) * 10.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:11'
}
SLGUserProgress >> updateSubtopicScore [

	subtopicScore := subtopicScore + 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:11'
}
SLGUserProgress >> updateTopicScore [

	topicScore := topicScore + 1.
]
