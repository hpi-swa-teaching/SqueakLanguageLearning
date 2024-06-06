Class {
	#name : #AbstractNavigationPage,
	#superclass : #AbstractPage,
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:11'
}
AbstractNavigationPage class >> newWithWithController: aController [

	^super basicNew initializeWithController: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 23:03'
}
AbstractNavigationPage >> addButtonsWithTitles: titles [

 	| button |  
	     
	titles withIndexDo: [:title :index |
		button := SimpleButtonMorph new label: title.
		button position: (self position + (500@(index * 100)));
			shadowOffset: 5 @ 5;
			shadowColor: Color gray.
		button target: self.
		button actionSelector: #buttonClicked:.
		button arguments: { index }.
	      self addMorph: button.
	]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 23:08'
}
AbstractNavigationPage >> buttonClicked: buttonIndex [

	self subclassResponsibility.




]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:22'
}
AbstractNavigationPage >> initializeWithController: aController [
	
	super initializeWithController: aController.
	self bounds: (0@0 extent: 1200@900);
            color: Color white;
            center: World bounds center.
	
	

]
