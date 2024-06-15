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
	#'squeak_changestamp' : 'yegi 6/15/2024 10:44'
}
AbstractPage class >> buttonWidth [

	^ (500 * 0.4) px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 11:22'
}
AbstractPage class >> descriptionFont [

	^ (35 * 0.5) px "0.55) px"
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:51'
}
AbstractPage class >> descriptionMargin [

	^ (100 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/11/2024 16:26'
}
AbstractPage class >> descriptionWidth [

	^ self pageWidth - (self descriptionMargin * 2)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/14/2024 17:19'
}
AbstractPage class >> iconFont [

	^ 18px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/14/2024 17:14'
}
AbstractPage class >> iconMarginHeight [

	^ 100px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/14/2024 17:13'
}
AbstractPage class >> iconMarginWidth [

	^ 100px
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
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
AbstractPage class >> pageBorder [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
AbstractPage class >> pageHeight [

	^ (1204 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
AbstractPage class >> pageMargin [

	^ 2 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:52'
}
AbstractPage class >> pageWidth [

	^ (1604 * 0.55) px
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 00:45'
}
AbstractPage class >> pastelGreen [
	^Color r: 0.39 g: 0.81 b: 0.53
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 01:05'
}
AbstractPage class >> softGreen [
	^Color r: 0.54 g: 0.97 b: 0.56
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 01:02'
}
AbstractPage class >> softYellow [
	^Color r: 1 g: 0.8 b: 0.5
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:14'
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
	self backButton: backButton.
	self header addMorph: backButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 11:01'
}
AbstractPage >> addCloseButton [
	| closeButton |
	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		borderColor: Color orange;
		height: 30px;
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
	#'squeak_changestamp' : 'yegi 6/15/2024 11:50'
}
AbstractPage >> addHomeButton [

	| imageMorph  homeButton  |
	
	homeButton := SLGNavigationButtonGen new
		color: Color transparent;
		label: '';
		borderWidth: 0;   
		onClickWithBlock: [
			self controller routerController navigateTo: '/home'.
		].
	
	imageMorph := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/logoCircle-small.png')) asMorph.

	
	homeButton addMorph: imageMorph.
	
	homeButton extent: imageMorph extent * 0.5.
	homeButton center: self header center.
	imageMorph center: homeButton center + (0 @ -40).
	
	
	self header addMorph: homeButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 02:03'
}
AbstractPage >> addResetButton [

	| resetButton |
	
	resetButton := PluggableButtonMorph new
					onColor: Color veryVeryLightGray offColor: Color white;
					label: 'Reset';
					textColor: Color darkGray;
					borderColor: Color white;
					borderWidth: 0;
					cornerStyle: #rounded;
					target: self;
					actionSelector: #resetAction.
				
	
	resetButton center: self footer center.
	
	self footer addMorph: resetButton.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 11:20'
}
AbstractPage >> addTitle: aString [

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
AbstractPage >> backButton [
	^ backButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:13'
}
AbstractPage >> backButton: anObject [
	backButton := anObject
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
	#'squeak_changestamp' : 'yegi 6/14/2024 21:48'
}
AbstractPage >> displayExperiencePoint [
	
	| cheeseImg marginwidth marginHeight |
	
	"adding morphs"
	"cheeseImg := (GitAssetLoader for: 'SqueakLanguageLearning') loadImageMorph: '/assets/badge-main.png'.
	cheeseImg scaleFactor: 0.5."	
	cheeseImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/cheese_small.png') 
										magnifyBy: 0.5) asMorph.
	
	scoreDisplay := SLGMultilineTextGen new setText: score asString.
	scoreDisplay width: 150; 
				setFontSize: AbstractPage iconFont;
				color: Color orange.
	
	"positioning the morphs"
	marginwidth := AbstractPage iconMarginWidth.
	marginHeight := AbstractPage iconMarginHeight.
	cheeseImg addMorph: scoreDisplay.
	cheeseImg center: self header center + (0 @ marginHeight * 0.25) - (marginwidth * 0.7 @ 0).
 	scoreDisplay center: cheeseImg center + (marginwidth * 0.55 @ 0).
	
	self header addMorph: cheeseImg.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/14/2024 22:00'
}
AbstractPage >> displayMainBadge [
	
	| badgeImg marginwidth marginHeight |

	badgeImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/badge-main.png') 
										magnifyBy: 0.7) asMorph.
	
	"TODO for BADGE COUNTING"
	"badgeCount := "
	topicScoreDisplay := SLGMultilineTextGen new setText: 0 asString.
	topicScoreDisplay width: 150; 
				setFontSize: AbstractPage iconFont;
				color: Color orange.
	
	"positioning the morphs"
	marginwidth := AbstractPage iconMarginWidth.
	marginHeight := AbstractPage iconMarginHeight.
	badgeImg addMorph: topicScoreDisplay.
	badgeImg center: self header center + (marginwidth * 2.5 @ marginHeight  * 0.25).
 	topicScoreDisplay center: badgeImg center + (marginwidth * 0.53 @ 0).
	
	self header addMorph: badgeImg.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/14/2024 22:01'
}
AbstractPage >> displaySubBadge [
	
	| badgeImg marginwidth marginHeight |

	badgeImg := (((GitAssetLoader for: 'SqueakLanguageLearning') 
										loadForm: '/assets/badge_silver.png') 
										magnifyBy: 0.7) asMorph.
	
	"TODO for BADGE COUNTING"
	"badgeCount := "
	subtopicScoreDisplay := SLGMultilineTextGen new setText: 0 asString.
	subtopicScoreDisplay width: 150; 
				setFontSize: AbstractPage iconFont;
				color: Color orange.
	
	"positioning the morphs"
	marginwidth := AbstractPage iconMarginWidth.
	marginHeight := AbstractPage iconMarginHeight.
	badgeImg addMorph: subtopicScoreDisplay.
	badgeImg center: self header center + (0 @ marginHeight  * 0.25).
 	subtopicScoreDisplay center: badgeImg center + (marginwidth * 0.53 @ 0).
	
	self header addMorph: badgeImg.

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
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:14'
}
AbstractPage >> hideBackButton [
	self backButton hide.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/15/2024 01:37'
}
AbstractPage >> initializeWithController: aController [
	
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
AbstractPage >> navigateBack [
 
	controller navigateBack.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/15/2024 00:40'
}
AbstractPage >> resetAction [

		SLGUserProgress reset.
		SLGMainController new.
		self controller routerController closeWindow.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/15/2024 13:14'
}
AbstractPage >> showBackButton [
	self backButton show.
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
	#'squeak_changestamp' : 'yegi 6/14/2024 22:05'
}
AbstractPage >> updateSubtopicScoreDisplay [
	
	subtopicScore := SLGUserProgress userData subtopicScore.
	subtopicScoreDisplay setText: subtopicScore asString.
	
	Transcript show: 'You have  completed ', subtopicScore, ' subtopics!'; cr.
	"Transcript show: 'You have earned a badge for a subtopic ""', self subtopic title, '""'; cr." 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'yegi 6/14/2024 22:06'
}
AbstractPage >> updateTopicScoreDisplay [
	
	topicScore := SLGUserProgress userData topicScore.
	topicScoreDisplay setText: topicScore asString.
	
	Transcript show: 'You have completed ', topicScore, ' topics!'; cr.
	"Transcript show: 'You have earned a badge for a topic ""', self topic title,'""'; cr."
]
