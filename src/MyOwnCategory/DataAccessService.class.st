Class {
	#name : #DataAccessService,
	#superclass : #Object,
	#instVars : [
		'topics'
	],
	#category : #MyOwnCategory
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:21'
}
DataAccessService class >> new [

	^super new initialize
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
DataAccessService >> initialize [

	| task lessons subtopics |
	lessons := Array new: 7.
	1 to: 7 do: [:index |
  		task := Task newWithDescription: 'TaskDescription', index asString.
		lessons at: index put: (Lesson newWithDescription: 'LessonDescription', index asString andTask: task).
	].

	subtopics := Array new: 1.
	subtopics at: 1 put: (Subtopic newWithTitle: 'SubtopicTitle' andLessons: lessons).
	
	topics := Array new: 1.
	topics at: 1 put: (Topic newWithTitle: 'TopicTitle' Description: 'TopicDescription' andSubtopics: subtopics).
	

	 
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 15:52'
}
DataAccessService >> readFileAsCollection: fileName [

	| contents linesArray |
	contents := self readFromFile: fileName.
	contents ifNotNil: [
            "Split contents into lines"
            linesArray := contents findTokens: ','.
            ^ linesArray.
	] ifNil: [ ^ nil ]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 00:07'
}
DataAccessService >> readFromFile: fileName [
	
	| fileStream contents |
	fileStream := StandardFileStream readOnlyFileNamed: fileName.
	fileStream ifNotNil: [
		contents := fileStream contentsOfEntireFile.
		fileStream close.
		^contents
	] ifNil: [
    		Transcript show: 'File does not exist.'; cr.
	]
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 5/26/2024 22:00'
}
DataAccessService >> topics [
	^ topics
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:38'
}
DataAccessService >> writeToFile: filePath contents: contentString [

        | fileStream |
        [
            fileStream := FileStream newFileNamed: filePath.
            fileStream isNil ifTrue: [^self error: 'Cannot open file'].
            fileStream nextPutAll: contentString.
            fileStream close.
        ] on: Error do: [:ex | 
            Transcript show: 'An error occurred while writing to file: ', ex messageText; cr.
            ^self error: 'Cannot open file'].
]
