Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:50'
}
AbstractPage >> initialize [
	super initialize.
	self color: Color white;
		extent: 1200@900;
		borderWidth: 10;
		borderColor: Color gray;
		center: Display center.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:16'
}
AbstractPage >> open [
	self openInWorld
]
