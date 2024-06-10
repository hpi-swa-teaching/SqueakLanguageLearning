Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#instVars : [
		'controller',
		'header',
		'body',
		'footer'
	],
	#classInstVars : [
		'pageWidth',
		'pageHeight'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
AbstractPage class >> newWithController: aController [

	^super basicNew initializeWithController: aController
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 13:15'
}
AbstractPage class >> pageHeight [

	^ 904
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 13:20'
}
AbstractPage class >> pageMargin [

	^ 2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 13:20'
}
AbstractPage class >> pageWidth [

	^ 1204
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:44'
}
AbstractPage >> addBackButton [

	| backButton |
	
	backButton := SLGNavigationButtonGen new
		label: 'Back';
		center: self header leftCenter + (60@0);
		width: 100;
		onClickWithBlock: [
			self controller routerController navigateBack.
		].
		
        self header addMorph: backButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 22:51'
}
AbstractPage >> addCloseButton [
	| closeButton |
	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		center: self header rightCenter - (70@0);
		width: 100;
		onClickWithBlock: [
			self controller routerController closeWindow.
		].
		
        self header addMorph: closeButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:49'
}
AbstractPage >> addTitle: aString [

	| title |
	
	title := SLGTextGen new
		setText: aString;
		center: self header center.
		
        self header addMorph: title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
AbstractPage >> body [
	^ body
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
AbstractPage >> body: anObject [
	body := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/3/2024 00:15'
}
AbstractPage >> controller [
	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:40'
}
AbstractPage >> footer [
	^ footer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:40'
}
AbstractPage >> footer: anObject [
	footer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
AbstractPage >> header [
	^ header
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
AbstractPage >> header: anObject [
	header := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 13:24'
}
AbstractPage >> initializeWithController: aController [
	
	|width height margin|
	super initialize.
	controller := aController.
	width := self class pageWidth.
	height := self class pageHeight.
	margin := self class pageMargin.
	
	self extent: width@height;
		color: Color white; 
		borderWidth: 2;
		borderColor: Color orange;
		center: Display center.
		
	self header: (Morph new
		width: width - 2 * margin;
		height: 80;
		position: self position + (margin asPoint);
		color: Color white).
		
	self body: (Morph new
		width: width - 2 * margin;
		height: 740;
		position: self position + (margin @ (margin +self header height));
		color: Color white).
		
	self footer: (Morph new
		width: width - 2 * margin;
		height: 80;
		position: self position + (margin @ ( margin + self header height + self body height));
		color: Color white).
		
	self addMorph: header.
	self addMorph: body.
	self addMorph: footer.
	

	
	self addBackButton.
	self addCloseButton.
		
	^self
	
		
		
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
AbstractPage >> navigateBack [
 
	controller navigateBack.
	
]
