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
	#'squeak_changestamp' : 'EB 6/26/2024 15:56'
}
SLGUserProgress class >> subtopicScorePoint [

	^1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:56'
}
SLGUserProgress class >> topicScorePoint [

	^1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:59'
}
SLGUserProgress class >> userData [

	^ Instance
		ifNil: [Instance := self new]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:55'
}
SLGUserProgress class >> userScoreFactor [

	^10
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
	#'squeak_changestamp' : 'EB 6/26/2024 15:58'
}
SLGUserProgress >> completed: aSetOfIDs [
	completed := aSetOfIDs
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
	#'squeak_changestamp' : 'EB 7/1/2024 15:13'
}
SLGUserProgress >> isTaskCompleted: aTaskID [

	^completed includes: aTaskID

	
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
	#'squeak_changestamp' : 'EB 6/26/2024 15:50'
}
SLGUserProgress >> score: aScore [
	score := aScore
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
	#'squeak_changestamp' : 'EB 6/26/2024 15:50'
}
SLGUserProgress >> subtopicScore: aScore [
	subtopicScore := aScore
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
	#'squeak_changestamp' : 'EB 6/26/2024 15:50'
}
SLGUserProgress >> topicScore: aScore [
	topicScore := aScore
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:56'
}
SLGUserProgress >> updateScore [
	
	score := (completed size) * self class userScoreFactor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:57'
}
SLGUserProgress >> updateSubtopicScore [

	subtopicScore := subtopicScore + self class subtopicScorePoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/26/2024 15:57'
}
SLGUserProgress >> updateTopicScore [

	topicScore := topicScore + self class topicScorePoint
]
