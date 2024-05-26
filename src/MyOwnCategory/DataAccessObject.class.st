Class {
	#name : #DataAccessObject,
	#superclass : #Object,
	#category : #MyOwnCategory
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
	#'squeak_changestamp' : 'EB 5/26/2024 15:52'
}
DataAccessObject >> readFileAsCollection: fileName [

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
