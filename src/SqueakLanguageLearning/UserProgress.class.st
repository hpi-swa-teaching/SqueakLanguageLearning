Class {
	#name : #UserProgress,
	#superclass : #Object,
	#instVars : [
		'completed',
		'experiencePoint'
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
	#'squeak_changestamp' : 'yegi 6/11/2024 23:12'
}
UserProgress >> experiencePoint [
	^ experiencePoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/11/2024 23:12'
}
UserProgress >> experiencePoint: aNumber [
	experiencePoint := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/12/2024 00:20'
}
UserProgress >> initialize [
	completed := Set new.
	experiencePoint := 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/12/2024 01:12'
}
UserProgress >> updateExperiencePoint [

	experiencePoint := (completed size) * 100.
	Transcript show: experiencePoint.
]
