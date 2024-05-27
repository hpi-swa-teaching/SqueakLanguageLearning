Class {
	#name : #NavigationPage,
	#superclass : #Page,
	#instVars : [
		'pagesDictionary'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/26/2024 23:22'
}
NavigationPage class >> newWithPagesDictionary: aPagesDictionary [

	^super new initializeWithPagesDictionary: aPagesDictionary
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 00:06'
}
NavigationPage >> addButtonsWithTitles: titles [

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
	#'squeak_changestamp' : 'EB 5/27/2024 21:35'
}
NavigationPage >> initializeWithPagesDictionary: aPagesDictionary [

	pagesDictionary := aPagesDictionary.
	self addButtonsWithTitles: aPagesDictionary keys.
	
	self bounds: (0@0 extent: 1200@900);
            color: Color white;
            center: World bounds center.
	
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/27/2024 22:23'
}
NavigationPage >> navigateToPage: aTitle [

        | page |
        page := pagesDictionary at: aTitle.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: page.
        page show.
	
]
