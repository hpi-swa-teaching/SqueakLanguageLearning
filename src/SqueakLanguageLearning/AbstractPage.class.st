Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 10:34'
}
AbstractPage >> initialize [
|closeButton|
super initialize.

closeButton := FunctionButtons new.
closeButton closeButton.
self color: Color white;
	extent: 1200@900;
	borderWidth: 10;
	borderColor: Color black;
	center: Display center;
	addMorph: closeButton.
closeButton position: (self position + closeButton position).
	
]
