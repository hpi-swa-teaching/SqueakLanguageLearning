"
This class represents short text locked on a page with a certain style and size, e.g., for titles for topics, subtopics and lessons on the corresponding pages.
"
Class {
	#name : #SLGTextGen,
	#superclass : #TextMorph,
	#instVars : [
		'content'
	],
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:31'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:54'
}
SLGTextGen >> content [
	^ content
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:45'
}
SLGTextGen >> content: aString [
	content := aString
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 09:50'
}
SLGTextGen >> initialize [

	super initialize.
	
	self content: ' '.
	self lock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/9/2024 13:05'
}
SLGTextGen >> setFontSize: anInteger [

	 self fontName: 'LiberationSans' size: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 7/5/2024 09:46'
}
SLGTextGen >> setText: aString [

	self content: aString.
	self contents: aString
]
