Class {
	#name : #SLGUserProgress,
	#superclass : #Object,
	#instVars : [
		'completed'
	],
	#classVars : [
		'Instance'
	],
	#category : #'SqueakLanguageLearning-Controllers'
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
	#'squeak_changestamp' : 'EB 6/13/2024 22:59'
}
SLGUserProgress >> getScore [
	
	^ (completed isEmpty) 
		ifTrue: [0] 
		ifFalse: [completed size * 10]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/12/2024 14:43'
}
SLGUserProgress >> initialize [

	completed := Set new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/12/2024 14:43'
}
SLGUserProgress >> markTaskAsCompleted: aTaskID [

        (completed includes: aTaskID) 
		ifFalse: [ completed add: aTaskID. ]
]
