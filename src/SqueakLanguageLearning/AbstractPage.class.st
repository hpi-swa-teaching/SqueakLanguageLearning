Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#instVars : [
		'contentManager'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 22:45'
}
AbstractPage >> initialize [

	super initialize.
	self color: Color white;
		extent: 1200@900;
		borderWidth: 10;
		borderColor: Color gray;
		center: Display center.
	contentManager := ContentManager new. "add a ContentManager to each page"
	contentManager page: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:16'
}
AbstractPage >> open [
	self openInWorld
]
