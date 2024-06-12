Class {
	#name : #SLGAbstractPage,
	#superclass : #Morph,
	#instVars : [
		'contentManager'
	],
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:49'
}
SLGAbstractPage class >> pageBorderColor [

	^ Color lightGray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:49'
}
SLGAbstractPage class >> pageBorderWidth [

	^ 10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:49'
}
SLGAbstractPage class >> pageColor [
	
	^ Color white
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:49'
}
SLGAbstractPage class >> pageExtent [

	^ 1200 @ 900
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 16:42'
}
SLGAbstractPage class >> pageHeader [

	^ 1200 @ 900
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/21/2024 20:50'
}
SLGAbstractPage >> initialize [

	super initialize.
	self color: self class pageColor;
		extent: self class pageExtent;
		borderWidth: self class pageBorderWidth;
		borderColor: self class pageBorderColor;
		center: Display center.
	contentManager := SLGContentManager new. "add a ContentManager to each page"
	contentManager page: self.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 5/13/2024 11:16'
}
SLGAbstractPage >> open [
	self openInWorld
]
