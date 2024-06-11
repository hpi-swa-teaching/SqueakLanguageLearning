Class {
	#name : #UserProgress,
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
UserProgress class >> reset [

		Instance := nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/11/2024 13:50'
}
UserProgress class >> userData [
	^ Instance
		ifNil: [Instance := self new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 13:51'
}
UserProgress >> completed [
	^ completed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 13:51'
}
UserProgress >> completed: anObject [
	completed := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 13:53'
}
UserProgress >> initialize [
	completed := Set new
]
