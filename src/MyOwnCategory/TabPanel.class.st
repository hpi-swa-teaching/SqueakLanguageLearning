Class {
	#name : #TabPanel,
	#superclass : #Morph,
	#instVars : [
		'pagesDictionary'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:22'
}
TabPanel class >> newWithPagesDictionary: aPagesDictionary [

	^super new initializeWithPagesDictionary: aPagesDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 00:06'
}
TabPanel >> addButtonsWithTitles: titles [

        titles withIndexDo: [:title :index |
            | button |
		button := SimpleButtonMorph new label: title.
		button position: (self position + (500@(index * 75))).
		button target: self.
		button actionSelector: #navigateToPage:.
		button arguments: { title }.
	      self addMorph: button.
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:53'
}
TabPanel >> initializeWithPagesDictionary: aPagesDictionary [

	pagesDictionary := aPagesDictionary.
	self addButtonsWithTitles: aPagesDictionary keys.
	
	self bounds: (0@0 extent: 1200@900);
            color: Color transparent;
            center: World bounds center.
	
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:25'
}
TabPanel >> navigateToPage: aTitle [

        | page |
        page := pagesDictionary at: aTitle.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: page.
        page show.
	
]
