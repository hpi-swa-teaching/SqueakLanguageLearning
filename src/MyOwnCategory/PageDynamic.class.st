Class {
	#name : #PageDynamic,
	#superclass : #Morph,
	#instVars : [
		'controller'
	],
	#category : #'MyOwnCategory-DynamicPages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
PageDynamic class >> newWithController: aController [

	^super basicNew initializeWithController: aController
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:20'
}
PageDynamic >> addBackButton [

         | backButton |
        backButton := SimpleButtonMorph new label: 'Back'.
        backButton color: Color gray.
        backButton borderWidth: 2.
        backButton borderColor: Color black.
        backButton position: (self position + (50@20)).
        backButton target: self.
        backButton actionSelector: #navigateBack.

        self addMorph: backButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 10:51'
}
PageDynamic >> addTitle: aString [

	| title |
	title := StringMorph new contents: aString.
	title font: (TextStyle default fontOfSize: 35).
	title
    		align: title topCenter - 35 with: self topCenter.
        self addMorph: title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/3/2024 00:15'
}
PageDynamic >> controller [
	^ controller
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:19'
}
PageDynamic >> initializeWithController: aController [
	
	super initialize.
	controller := aController.
	
	self extent: 1200@900;
		color: Color white; 
		borderWidth: 10;
		borderColor: Color lightGray;
		center: Display center.
		
	^self
	
		
		
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
PageDynamic >> navigateBack [
 
	controller navigateBack.
	
]
