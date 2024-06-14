Class {
	#name : #AbstractPage,
	#superclass : #Morph,
	#instVars : [
		'controller',
		'header',
		'body',
		'footer',
		'score',
		'scoreDisplay',
		'topicScore',
		'subtopicScore',
		'topicScoreDisplay',
		'subtopicScoreDisplay'
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
	#'squeak_changestamp' : 'yegi 6/12/2024 23:35'
}
AbstractPage class >> softYellow [

	^Color r: 1 g: 0.8 b: 0.5
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/13/2024 11:38'
}
AbstractPage >> addBackButton [

	| backButton |
	
	backButton := SLGNavigationButtonGen new
		label: 'Back';
		borderColor: Color orange;
		height: 50;
		"color: Color veryVeryLightGray;"
		onClickWithBlock: [
			self controller routerController navigateBack.
		].
	
	backButton width: backButton width + 40.
	backButton center: self header leftCenter + ((backButton width)/2 @ 0) + ((self header height - backButton height)/2 @ 0).
	
	self header addMorph: backButton.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/13/2024 11:39'
}
AbstractPage >> addCloseButton [
	| closeButton |
	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		borderColor: Color orange;
		height: 50;
		"color: Color veryVeryLightGray;"
		onClickWithBlock: [
			self controller routerController closeWindow.
		].
	
	closeButton width: closeButton width + 40.
	closeButton center: self header rightCenter - ((closeButton width)/2 @ 0) - ((self header height - closeButton height)/2 @ 0).
	
	self header addMorph: closeButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/12/2024 23:24'
}
AbstractPage >> addHomeButtom [

	| imageMorph  homeButton  |
	
	homeButton := SLGNavigationButtonGen new
		color: Color transparent;
		label: '';
		borderWidth: 0;   
		onClickWithBlock: [
			self controller routerController navigateTo: '/home'.
		].
	
	homeButton width: homeButton width + 40.
	
	imageMorph := (GitAssetLoader for: 'SqueakLanguageLearning') loadImageMorph: '/assets/logoCircle.png'.
	imageMorph scaleFactor: 0.5.
	homeButton extent: imageMorph extent * 0.5.
	homeButton center: self header center.
	imageMorph center: homeButton center.
	homeButton addMorph: imageMorph.
	
	self header addMorph: homeButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/13/2024 18:32'
}
AbstractPage >> addTitle: aString [

	| title |
	
	title := SLGTextGen new
		setText: aString;
		color: Color black;
		setFontSize: 40;
		center: self body center - (self body width * 0.03 @ 0) ;
		top: self body top + (self body height * 0.05).
		

        self body addMorph: title
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 17:22'
}
AbstractPage >> displayExperiencePoint [
	
	| cheeseImg |
	
	"adding morphs"
	cheeseImg := (GitAssetLoader for: 'SqueakLanguageLearning') loadImageMorph: '/assets/cheese_small.png'.
	cheeseImg scaleFactor: 0.5.
	
	scoreDisplay := SLGMultilineTextGen new setText: score asString.
	scoreDisplay width: 150; 
				setFontSize: 50;
				centered;
				color: Color orange.
	
	"positioning the morphs"
	cheeseImg center: self header center + ((cheeseImg width) * 3 @ 10) - ((self header height - cheeseImg height) * 2 @ 0).
 	scoreDisplay center: cheeseImg center + (100 @ 5).
	
	
	cheeseImg addMorph: scoreDisplay.
	self header addMorph: cheeseImg.

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
	#'squeak_changestamp' : 'EB 6/14/2024 20:35'
}
AbstractPage >> initializeWithController: aController [
	
	| margin |
	
	super initialize.
	
	controller := aController.
	score := SLGUserProgress userData score.
	subtopicScore := SLGUserProgress userData subtopicScore.
	topicScore := SLGUserProgress userData topicScore.
	
	self extent: 1604 @ 1204;
		"extent: 1404@904;"
		color: Color white; 
		borderWidth: 2;
		center: Display center.

	margin := 2.
			
	self header: (Morph new
		width: self width - (2 * margin);
		height: (10 * (self height - (2 * margin)))/100; "header has 10% of height of page"
		position: self position + (margin asPoint);
		borderWidth: 1;
		color: Color white).	
		
	self body: (Morph new
		width: self width - 100;
		height: (85 * (self height - (2 * margin)))/100; 
		position: self position + (margin @ ((self header height * 3) + margin));
		cornerStyle: #rounded;
		cornerRadius: 20;
		center: self center + (0 @  self header height * 0.5);
		color: self class softYellow). 
		
	"self footer: (Morph new
		width: self width - (2 * margin);
		height: (10 * (self height - (2 * margin)))/100; ""footer has 10% of height of page"
		"position: self position + (margin @ (self header height + self body height + margin));
		color: Color white)."
		
	self addMorph: header.
	self addMorph: body.
	"self addMorph: footer."
	
	self addBackButton.
	self addCloseButton.
	self displayExperiencePoint.
	self addHomeButtom.
		
	^self
	
		
		
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
AbstractPage >> navigateBack [
 
	controller navigateBack.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:04'
}
AbstractPage >> updateScoreDisplay [
	
	score := SLGUserProgress userData score.
	"scoreDisplay ifNotNil: [ scoreDisplay setText: score asString. ]"
	scoreDisplay setText: score asString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:39'
}
AbstractPage >> updateSubtopicScoreDisplay [
	
	subtopicScore := SLGUserProgress userData subtopicScore.
	"subtopicScoreDisplay setText: subtopicScore asString."
	
	Transcript show: 'You have  completed ', subtopicScore, ' subtopics!'; cr.
	Transcript show: 'You have earned a badge for a subtopic "', self subtopic title, '"'; cr. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:41'
}
AbstractPage >> updateTopicScoreDisplay [
	
	topicScore := SLGUserProgress userData topicScore.
	"topicScoreDisplay setText: topicScore asString."
	
	Transcript show: 'You have completed ', topicScore, ' topics!'; cr.
	Transcript show: 'You have earned a badge for a topic "', self topic title,'"'; cr.
]
