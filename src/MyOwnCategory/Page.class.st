Class {
	#name : #Page,
	#superclass : #Morph,
	#instVars : [
		'dataReader'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 20:51'
}
Page class >> new [

	^super new initialize
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 21:16'
}
Page >> addBackButton [

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
	#'squeak_changestamp' : 'EB 5/23/2024 21:09'
}
Page >> addTitle: aString [

	| title |
	title := StringMorph new contents: aString.
	title font: (TextStyle default fontOfSize: 30).
	title
    		align: title topCenter
    		with: self topCenter.
        self addMorph: title
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:15'
}
Page >> hide [

	self visible: false
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 14:38'
}
Page >> initialize [
	
	super initialize.
	self extent: 1200@900;
		color: Color white; 
		center: Display center.
	self addBackButton.
	dataReader := DataAccessObject new.
		
	^self
	
		
		
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:16'
}
Page >> navigateBack [
 
	self owner allMorphsDo: [:morph |
		(morph isKindOf: Page) ifTrue: [ morph hide ].
	].
	self owner allMorphsDo: [:morph |
		(morph isKindOf: HomePage) ifTrue: [ morph show ].
	]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:14'
}
Page >> navigateTo: aPage [

	self hide.
	aPage show
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:14'
}
Page >> show [

	self visible: true
	
]
