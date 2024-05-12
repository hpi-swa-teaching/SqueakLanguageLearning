Class {
	#name : #SLGHomepage,
	#superclass : #Morph,
	#category : #SqueakLanguageLearning
}

{
	#category : #'instance-creation',
	#'squeak_changestamp' : 'SW 5/10/2024 09:06'
}
SLGHomepage class >> homepageColor [
	^ Color white
]

{
	#category : #'instance-creation',
	#'squeak_changestamp' : 'SW 5/10/2024 09:05'
}
SLGHomepage class >> homepageSize [
	^ 1200@900
]

{
	#category : #'instance-creation',
	#'squeak_changestamp' : 'SW 5/10/2024 10:16'
}
SLGHomepage class >> homepageTitle [
	^ 'Welcome to Squeak Lingo!'
]

{
	#category : #'instance-creation',
	#'squeak_changestamp' : 'SW 5/10/2024 09:00'
}
SLGHomepage class >> open [
	self new openInWorld center: Display center
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/10/2024 10:15'
}
SLGHomepage >> addTitle: aTitle [

	| aText font title |
	title := TextMorph new.
	font := (TextFontReference toFont: (StrikeFont familyName: 'Darkmap DejaVu Sans' size: 45)).
	aText := aTitle asText addAttribute: font; addAttribute: (TextColor color: Color black).
	title contents: aText.
	title position: ((self width - title width)/2)@0.
	self addMorph: title.
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/10/2024 12:24'
}
SLGHomepage >> createMenu [
	| menuBar |
	menuBar := MenuMorph new defaultTarget: self.
	menuBar add: 'Subpage 1' action: #showSubpage1.
	menuBar add: 'Subpage 2' action: #showSubpage2.
	menuBar position: 0@self height - menuBar height.
	self addMorph: menuBar
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/10/2024 12:24'
}
SLGHomepage >> initialize [
	super initialize.
	self color: self class homepageColor;
		extent: self class homepageSize;
		addTitle: self class homepageTitle;
		createMenu
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/11/2024 19:25'
}
SLGHomepage >> showSubpage1 [

	| subpage1 |
	subpage1 := SLGSubpage new.
	subpage1 openInWorld center: Display center.
	subpage1 homepage: self.
	self delete

]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/11/2024 19:25'
}
SLGHomepage >> showSubpage2 [

	| subpage2 |
	subpage2 := SLGSubpage new.
	subpage2 openInWorld center: Display center.
	subpage2 homepage: self.
	self delete

]
