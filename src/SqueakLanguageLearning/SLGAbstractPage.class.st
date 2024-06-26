Class {
	#name : #SLGAbstractPage,
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
	#'squeak_changestamp' : 'yegi 6/15/2024 23:41'
}
SLGAbstractPage class >> buttonHeight [

	^ 30px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 10:44'
}
SLGAbstractPage class >> buttonWidth [

	^ (500 * 0.4) px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 11:22'
}
SLGAbstractPage class >> descriptionFont [

	^ (35 * 0.5) px "0.55) px"
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:51'
}
SLGAbstractPage class >> descriptionMargin [

	^ (100 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 16:26'
}
SLGAbstractPage class >> descriptionWidth [

	^ self pageWidth - (self descriptionMargin * 2)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/14/2024 17:14'
}
SLGAbstractPage class >> iconMarginHeight [

	^ 100px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/14/2024 17:13'
}
SLGAbstractPage class >> iconMarginWidth [

	^ 100px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
SLGAbstractPage class >> newWithController: aController [

	^super basicNew initializeWithController: aController
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
SLGAbstractPage class >> pageBorder [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
SLGAbstractPage class >> pageHeight [

	^ (1204 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
SLGAbstractPage class >> pageMargin [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
SLGAbstractPage class >> pageWidth [

	^ (1604 * 0.55) px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 00:45'
}
SLGAbstractPage class >> pastelGreen [
	^Color r: 0.39 g: 0.81 b: 0.53
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 22:13'
}
SLGAbstractPage class >> scoreDisplayWidth [

	^ 150px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 22:08'
}
SLGAbstractPage class >> scoreFontSize [

	^ 20px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/20/2024 01:31'
}
SLGAbstractPage class >> smallButtonWidth [

	^ 60px
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 01:02'
}
SLGAbstractPage class >> softYellow [
	^Color r: 1 g: 0.8 b: 0.5
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 01:32'
}
SLGAbstractPage >> addBackButton [

	| backButton |
	
	backButton := SLGNavigationButtonGen new
		label: 'Back';
		borderColor: Color orange;
		width: self class smallButtonWidth;
		height: self class buttonHeight;
		onClickWithBlock: [
			self controller routerController navigateBack.
		].
	
	backButton center: self header leftCenter + ((backButton width)/2 @ 0) + ((self header height - backButton height)/2 @ 0).
	self backButton: backButton.
	self header addMorph: backButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 01:32'
}
SLGAbstractPage >> addCloseButton [
	| closeButton |
	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		width: self class smallButtonWidth;
		borderColor: Color orange;
		height: self class buttonHeight;
		onClickWithBlock: [
			self controller routerController closeWindow.
		].
	
	closeButton center: self header rightCenter - ((closeButton width)/2 @ 0) - ((self header height - closeButton height)/2 @ 0).
	
	self header addMorph: closeButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 00:59'
}
SLGAbstractPage >> addHomeButton [

	| imageMorph  homeButton  |
	
	homeButton := SLGNavigationButtonGen new
		color: Color transparent;
		label: '';
		borderWidth: 0;   
		onClickWithBlock: [
			self controller routerController navigateTo: '/home'.
		].
	
	imageMorph := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/logo-80.png')
										magnifyBy: 1px) asMorph.

	
	homeButton addMorph: imageMorph.
	
	homeButton extent: imageMorph extent * 0.7.
	homeButton center: self header center- (0 @ 25px).
	imageMorph center: homeButton center .
	
	
	self header addMorph: homeButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/20/2024 01:51'
}
SLGAbstractPage >> addResetButton [

	| resetButton |
	
	resetButton := PluggableButtonMorph new
					onColor: Color veryVeryLightGray offColor: Color white;
					label: 'Reset';
					textColor: Color veryLightGray;
					borderColor: Color white;
					borderWidth: 0;
					cornerStyle: #rounded;
					target: self;
					actionSelector: #resetAction.
				
	
	resetButton center: self footer center + (0 @ self class pageMargin * 3).
	
	self footer addMorph: resetButton.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 11:20'
}
SLGAbstractPage >> addTitle: aString [

	| title |
	
	title := SLGTextGen new
		setText: aString;
		color: Color black;
		setFontSize: 20px;
		center: self body center - (self body width * 0.03 @ 0) ;
		top: self body top + (self body height * 0.04).
		

        self body addMorph: title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:13'
}
SLGAbstractPage >> backButton [
	^ backButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:13'
}
SLGAbstractPage >> backButton: anObject [
	backButton := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
SLGAbstractPage >> body [
	^ body
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
SLGAbstractPage >> body: anObject [
	body := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/3/2024 00:15'
}
SLGAbstractPage >> controller [
	^ controller
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:38'
}
SLGAbstractPage >> displayExperiencePoint [
	
	| cheeseImg marginwidth marginHeight |
	
	"adding morphs"
	"cheeseImg := (GitAssetLoader for: 'SqueakLanguageLearning') loadImageMorph: '/assets/badge-main.png'.
	cheeseImg scaleFactor: 0.5."	
	cheeseImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/cheese-30.png') 
										magnifyBy: 1px) asMorph.
	
	scoreDisplay := SLGMultilineTextGen new setText: score asString.
	scoreDisplay width: self class scoreDisplayWidth; 
				setFontSize: self class scoreFontSize;
				color: Color orange.
	
	"positioning the morphs"
	marginwidth := self class iconMarginWidth.
	marginHeight := self class iconMarginHeight.
	cheeseImg addMorph: scoreDisplay.
	cheeseImg center: self header center - (marginwidth * 0.8 @ 0) + (0 @ marginHeight * 0.2) .
 	scoreDisplay center: cheeseImg center + (marginwidth * 0.95 @ 0).
	
	self header addMorph: cheeseImg.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:07'
}
SLGAbstractPage >> displayMainBadge [
	
	| badgeImg marginwidth marginHeight |

	badgeImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/badge-gold-30.png') 
										magnifyBy: 1px) asMorph.
	
	topicScoreDisplay := SLGMultilineTextGen new setText: 0 asString.
	topicScoreDisplay width: self class scoreDisplayWidth; 
				setFontSize: self class scoreFontSize;
				color: Color orange.
	
	marginwidth := SLGAbstractPage iconMarginWidth.
	marginHeight := SLGAbstractPage iconMarginHeight.
	badgeImg addMorph: topicScoreDisplay.
	badgeImg center: self header center + (marginwidth * 3 @ marginHeight  * 0.2).
 	topicScoreDisplay center: badgeImg center + (marginwidth * 0.95 @ 0).
	
	self header addMorph: badgeImg.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/19/2024 23:07'
}
SLGAbstractPage >> displaySubBadge [
	
	| badgeImg marginwidth marginHeight |

	badgeImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/badge-silver-30.png') 
										magnifyBy: 1px) asMorph.
	
	subtopicScoreDisplay := SLGMultilineTextGen new setText: 0 asString.
	subtopicScoreDisplay width: self class scoreDisplayWidth; 
				setFontSize: self class scoreFontSize;
				color: Color orange.
	
	marginwidth := SLGAbstractPage iconMarginWidth.
	marginHeight := SLGAbstractPage iconMarginHeight.
	badgeImg addMorph: subtopicScoreDisplay.
	badgeImg center: self header center + (0 @ marginHeight  * 0.2) - (marginwidth * 0.05 @ 0).
 	subtopicScoreDisplay center: badgeImg center + (marginwidth * 0.95 @ 0).
	
	self header addMorph: badgeImg.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:40'
}
SLGAbstractPage >> footer [
	^ footer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:40'
}
SLGAbstractPage >> footer: anObject [
	footer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
SLGAbstractPage >> header [
	^ header
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 21:39'
}
SLGAbstractPage >> header: anObject [
	header := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:14'
}
SLGAbstractPage >> hideBackButton [
	self backButton hide.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/16/2024 01:34'
}
SLGAbstractPage >> initializeWithController: aController [
	
	| width height margin border |
	
	super initialize.
	
	controller := aController.
	score := SLGUserProgress userData score.
	subtopicScore := SLGUserProgress userData subtopicScore.
	topicScore := SLGUserProgress userData topicScore.
	
	width := self class pageWidth.
	height := self class pageHeight.
	border := self class pageBorder.
	
	self extent: width@height;
		"extent: 1404@904;"
		color: Color white; 
		center: Display center.

	margin := 2px.
			
	self header: (Morph new
		width: self width - (2 * margin);
		height: (12 * (self height - (2 * margin)))/100; "header has 10% of height of page"
		position: self position + (margin asPoint);
		borderWidth: 1;
		color: Color white).	
		
	self body: (Morph new
		width: self width - 50px;
		height: (83 * (self height - (2 * margin)))/100; 
		position: self position;" + (margin @ ((self header height * 3))); ""+ margin));"
		cornerStyle: #rounded;
		cornerRadius: 20;
		center: self center + (0 @ self header height * 0.3); " (margin @ (self header height + margin));"
		color: self class softYellow). 
		
	self footer: (Morph new
		width: self width - (2 * margin);
		height: (5 * (self height - (2 * margin)))/100; 
		position: self position + (margin @ (self header height + self body height + margin));
		color: Color white).
		
	self addMorph: header.
	self addMorph: body.
	self addMorph: footer.
	
	self addBackButton.
	self addCloseButton.
	self displayExperiencePoint.
	self displaySubBadge.
	self displayMainBadge.
	self addHomeButton.
	self addResetButton.
		
	^self
	
		
		
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
SLGAbstractPage >> navigateBack [
 
	controller navigateBack.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/16/2024 16:33'
}
SLGAbstractPage >> refresh [
	"This method gets called everytime, when we navigate to this page with SLGRouter"
	self updateScoreDisplay.
	self updateSubtopicScoreDisplay.
	self updateTopicScoreDisplay.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/15/2024 00:40'
}
SLGAbstractPage >> resetAction [

		SLGUserProgress reset.
		SLGMainController new.
		self controller routerController closeWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:14'
}
SLGAbstractPage >> showBackButton [
	self backButton show.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/14/2024 20:04'
}
SLGAbstractPage >> updateScoreDisplay [
	
	score := SLGUserProgress userData score.
	"scoreDisplay ifNotNil: [ scoreDisplay setText: score asString. ]"
	scoreDisplay setText: score asString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/14/2024 22:05'
}
SLGAbstractPage >> updateSubtopicScoreDisplay [
	
	subtopicScore := SLGUserProgress userData subtopicScore.
	subtopicScoreDisplay setText: subtopicScore asString.
	
	Transcript show: 'You have  completed ', subtopicScore, ' subtopics!'; cr.
	"Transcript show: 'You have earned a badge for a subtopic ""', self subtopic title, '""'; cr." 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/14/2024 22:06'
}
SLGAbstractPage >> updateTopicScoreDisplay [
	
	topicScore := SLGUserProgress userData topicScore.
	topicScoreDisplay setText: topicScore asString.
	
	Transcript show: 'You have completed ', topicScore, ' topics!'; cr.
	"Transcript show: 'You have earned a badge for a topic ""', self topic title,'""'; cr."
]
