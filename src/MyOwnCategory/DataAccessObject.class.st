Class {
	#name : #DataAccessObject,
	#superclass : #Object,
	#category : #'MyOwnCategory-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:21'
}
DataAccessObject class >> new [

	^super new initialize
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 00:07'
}
DataAccessObject >> readFromFile: fileName [
	
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/25/2024 11:38'
}
DataAccessObject >> writeToFile: filePath contents: contentString [

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
