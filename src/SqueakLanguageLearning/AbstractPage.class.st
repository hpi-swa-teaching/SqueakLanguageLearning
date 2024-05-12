Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/12/2024 14:10'
}
AbstractPage >> initialize [
super initialize.
self color: Color white;
	extent: 1200@900;
	borderWidth: 10;
	borderColor: Color black;
	center: Display center.
	
]
