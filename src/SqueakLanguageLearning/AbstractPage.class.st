Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#instVars : [
		'controller',
		'header',
		'body',
		'footer'
	],
	#category : #'SqueakLanguageLearning-Pages'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 10:12'
}
AbstractPage class >> buttonWidth [

	^ 500
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 10:18'
}
AbstractPage class >> descriptionFont [

	^ 35
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 16:26'
}
AbstractPage class >> descriptionMargin [

	^ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 16:26'
}
AbstractPage class >> descriptionWidth [

	^ self pageWidth - (self descriptionMargin * 2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
AbstractPage class >> newWithController: aController [

	^super basicNew initializeWithController: aController
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 16:50'
}
AbstractPage class >> pageBorder [

	^ 2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 09:52'
}
AbstractPage class >> pageHeight [

	^ 1204
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
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 09:52'
}
AbstractPage class >> pageWidth [

	^ 1604
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/11/2024 10:07'
}
AbstractPage >> addBackButton [

	| backButton |
	
	backButton := SLGNavigationButtonGen new
		label: 'Back';
		"center: self header leftCenter + (60@0);"
		"width: 100;"
		onClickWithBlock: [
			self controller routerController navigateBack.
		].
	
	backButton width: backButton width + 40.
	backButton center: self header leftCenter + ((backButton width)/2 @ 0) + ((self header height - backButton height)/2 @ 0).
	self header addMorph: backButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/11/2024 10:06'
}
AbstractPage >> addCloseButton [
	| closeButton |
	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		"center: self header rightCenter - (70@0);"
		"width: 100;"
		onClickWithBlock: [
			self controller routerController closeWindow.
		].
	
	closeButton width: closeButton width + 40.
	closeButton center: self header rightCenter - ((closeButton width)/2 @ 0) - ((self header height - closeButton height)/2 @ 0).
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
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 20:55'
}
AbstractPage >> initializeWithController: aController [
	
	|width height margin border|
	
	super initialize.
	
	controller := aController.
	width := self class pageWidth.
	height := self class pageHeight.
	margin := self class pageMargin.
	border := self class pageBorder.

	self extent: width@height;
		"extent: 1404@904;"
		color: Color white; 
		borderWidth: border;
		borderColor: Color orange;
		center: Display center.
			
	self header: (Morph new
		width: self width - (2 * margin);
		height: (10 * (self height - (2 * margin)))/100; "header has 10% of height of page"
		position: self position + (margin asPoint);
		color: Color white).
		
	self body: (Morph new
		width: self width - (2 * margin);
		height: (80 * (self height - (2 * margin)))/100; "body has 80% of height of page"
		position: self position + (margin @ (self header height + margin));
		color: Color white).
		
	self footer: (Morph new
		width: self width - (2 * margin);
		height: (10 * (self height - (2 * margin)))/100; "footer has 10% of height of page"
		position: self position + (margin @ (self header height + self body height + margin));
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
