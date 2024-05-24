Class {
	#name : #SLGContentManager,
	#superclass : #Object,
	#instVars : [
		'topicList',
		'progressList',
		'page'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:37'
}
SLGContentManager >> initialize [
	
	"keeps an OrderedCollection storing the topics as strings and a Dictionary storing the progress as booleans. Initialized by owner page."
	super initialize.
	progressList := Dictionary new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:07'
}
SLGContentManager >> page [
	^ page
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:07'
}
SLGContentManager >> page: anObject [
	page := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:07'
}
SLGContentManager >> progressList [
	^ progressList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:35'
}
SLGContentManager >> progressList: aList [	
	"this is a Dictionary of {topic : bool} that indicates if a topic is completed."	
	aList do: [:t | progressList add: #t->false].
	
	progressList keysAndValuesDo: [:aKey :aValue |             "testing"
   Transcript
      show: aKey printString;
      space;
      show: aValue printString;
      cr].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:07'
}
SLGContentManager >> topicList [
	^ topicList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:18'
}
SLGContentManager >> topicList: aList [

	topicList := aList
]
