"
Parent class to implement pages of the app e.g Home page, lesson page etc.
"
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
		'subtopicScoreDisplay',
		'backButton',
		'userProgress'
	],
	#category : #'SqueakLanguageLearning-Pages',
	#'squeak_changestamp' : 'yegi 7/9/2024 10:41'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:04'
}
SLGAbstractPage class >> Percentage [

	^ 100
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:07'
}
SLGAbstractPage class >> bodyPercentage [

	^ 83
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:54'
}
SLGAbstractPage class >> buttonHeight [

	^ 30
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:54'
}
SLGAbstractPage class >> buttonWidth [

	^ 200
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:00'
}
SLGAbstractPage class >> cheeseIconWidthMarginRatio [

	^ 0.8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:09'
}
SLGAbstractPage class >> cornerRadius [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:55'
}
SLGAbstractPage class >> descriptionFont [

	^ 17.5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:11'
}
SLGAbstractPage class >> descriptionMargin [

	^ 55
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:00'
}
SLGAbstractPage class >> descriptionWidth [

	^ self pageWidth - (self descriptionMargin * self duplicate) 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:59'
}
SLGAbstractPage class >> duplicate [

	^ 2
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 23:29'
}
SLGAbstractPage class >> footerPercentage [

	^ 5
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:53'
}
SLGAbstractPage class >> gapHeight [

	^ 15
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:20'
}
SLGAbstractPage class >> half [

	^ 0.5
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:03'
}
SLGAbstractPage class >> headerPercentage [

	^ 12
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:00'
}
SLGAbstractPage class >> homeBorderWidth [

	^ 3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:00'
}
SLGAbstractPage class >> homeButtonHeightMargin [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:13'
}
SLGAbstractPage class >> homeButtonMargin [

	^ 25
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:52'
}
SLGAbstractPage class >> homeButtonSizeRatio [

	^ 0.7
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> homeColumnCenterMargin [

	^ 0.1
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:03'
}
SLGAbstractPage class >> iconMarginHeight [

	^ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:04'
}
SLGAbstractPage class >> iconMarginWidth [

	^ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:01'
}
SLGAbstractPage class >> mainBadgeIconWidthMarginRatio [

	^ 3
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'yegi 7/10/2024 11:09'
}
SLGAbstractPage class >> newWithController: aControllerObject [
	
	^ self new
		controller: aControllerObject;
		yourself
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:05'
}
SLGAbstractPage class >> nextButtonHeight [

	^ 20
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 23:33'
}
SLGAbstractPage class >> pageHeight [

	^ 662.2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 21:01'
}
SLGAbstractPage class >> pageMargin [

	^ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/10/2024 23:33'
}
SLGAbstractPage class >> pageWidth [

	^ 882.2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:02'
}
SLGAbstractPage class >> pastelGreen [

	^Color r: 0.39 g: 0.81 b: 0.53
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:59'
}
SLGAbstractPage class >> scoreDisplayMarginHeightRatio [

	^ 0.2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:58'
}
SLGAbstractPage class >> scoreDisplayMarginWidthRatio [

	^ 0.95
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:06'
}
SLGAbstractPage class >> scoreDisplayWidth [

	^ 150
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:07'
}
SLGAbstractPage class >> scoreFontSize [

	^ 20
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:07'
}
SLGAbstractPage class >> smallButtonWidth [

	^ 60
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 10:48'
}
SLGAbstractPage class >> softYellow [

	^Color r: 1 g: 0.8 b: 0.5
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:02'
}
SLGAbstractPage class >> subBadgeIconWidthMarginRatio [

	^ 0.05
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:11'
}
SLGAbstractPage class >> taskViewExtent [

	^ (self taskViewHeight) px @ (self taskViewWidth) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:10'
}
SLGAbstractPage class >> taskViewHeight [

	^ 1200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:11'
}
SLGAbstractPage class >> taskViewWidth [

	^ 800
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:16'
}
SLGAbstractPage class >> titleHeightRatio [

	^ 0.03
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:17'
}
SLGAbstractPage class >> titlePositionHeightRatio [

	^ 0.04
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:17'
}
SLGAbstractPage class >> titlePositionWidthRatio [

	^ 0.03
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:08'
}
SLGAbstractPage class >> topicGapHeight [

	^ 11
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:41'
}
SLGAbstractPage class >> topicPageColumnCenterMargin [

	^ 0.35
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:37'
}
SLGAbstractPage >> addAllButtonsAndDisplay [
	
	self addBackButton;
		addCloseButton;
		addHomeButton;
		addResetButton;
		displayExperiencePoint;
		displaySubBadge;
		displayMainBadge
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:20'
}
SLGAbstractPage >> addBackButton [

	| backButton |
	backButton := self createButtonwithLabel: 'Back' 
						withOnClick: [self controller routerController navigateBack].
	backButton center: self header leftCenter 
							+ ((backButton width) * self class half @ 0) 
							+ ((self header height - backButton height) * self class half @ 0).
	self backButton: backButton.
	self header addMorph: backButton
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:01'
}
SLGAbstractPage >> addBasePage [

	self extent: (self class pageWidth)px @ (self class pageHeight)px;
		color: Color white; 
		center: Display center;
		header: self addHeader;
		body: self addBody; 
		footer: self addFooter
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:44'
}
SLGAbstractPage >> addBody [
	
	^ Morph new width: (self width - self class descriptionMargin) px;
		 height: (self class bodyPercentage * (self height - self class pageMargin)) px / self class Percentage;
		 position: self position;
		 cornerStyle: #rounded;
		 cornerRadius: (self class cornerRadius) px;
		 center: self center + (0 @ self header height * (self class topicPageColumnCenterMargin));
		 color: self class softYellow;
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:21'
}
SLGAbstractPage >> addCloseButton [

	| closeButton |	
	closeButton := self createButtonwithLabel: 'Close'
				withOnClick: [self controller routerController closeWindow].
	closeButton center: self header rightCenter 
							- ((closeButton width) * self class half @ 0) 
							- ((self header height - closeButton height) * self class half @ 0).
	self header addMorph: closeButton
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:08'
}
SLGAbstractPage >> addFooter [
	
	^ Morph new width: (self width - self class pageMargin) px;
		 height: (self class footerPercentage * (self height - self class pageMargin)) px / self class Percentage;
		 position: self position 
					+ ((self class pageMargin) px @ (self header height + self body height + self class pageMargin) px);
		 color: Color white;
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:45'
}
SLGAbstractPage >> addHeader [
	
	^ Morph new width: (self width - self class pageMargin) px;
		 height: (self class headerPercentage * (self height - self class pageMargin)) px / self class Percentage;
		 position: self position + (self class pageMargin) px asPoint;
		 color: Color white;
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:25'
}
SLGAbstractPage >> addHeaderBodyFooter [

	self addMorph: self header;
		addMorph: self body;
		addMorph: self footer
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:52'
}
SLGAbstractPage >> addHomeButton [

	| imageMorph  homeButton  |
	homeButton := self createHomeButton.
	imageMorph :=self loadImageAssetwith: '/assets/logo-80.png'.
	homeButton addMorph: imageMorph.
	homeButton extent: imageMorph extent * self class homeButtonSizeRatio.
	homeButton center: self header center- (0 @ (self class homeButtonMargin) px).
	imageMorph center: homeButton center.
	self header addMorph: homeButton
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:24'
}
SLGAbstractPage >> addResetButton [

	| resetButton |
	resetButton := self createResetButton.
	resetButton center: self footer center + (0 @ self class pageMargin).
	self footer addMorph: resetButton
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:27'
}
SLGAbstractPage >> addTitle: aString [

	| title |
	title := self createTitleTextMorph: aString.
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
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:05'
}
SLGAbstractPage >> constructView [

	self SubclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/3/2024 00:15'
}
SLGAbstractPage >> controller [
	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:49'
}
SLGAbstractPage >> controller: anObject [
	controller := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:07'
}
SLGAbstractPage >> createButtonwithLabel: aButtonTitle [ 
	
	SLGNavigationButtonGen new
		label: aButtonTitle;
		borderColor: Color orange;
		width: (self class smallButtonWidth) px;
		height: (self class buttonHeight) px
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:19'
}
SLGAbstractPage >> createButtonwithLabel: aButtonTitle withOnClick: aCodeblock [
	
	^ SLGNavigationButtonGen new
		label: aButtonTitle;
		borderColor: Color orange;
		width: (self class smallButtonWidth) px;
		height: (self class buttonHeight) px;
		onClickWithBlock: aCodeblock;
		yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 00:47'
}
SLGAbstractPage >> createHomeButton [
	
	^ SLGNavigationButtonGen new
		color: Color transparent;
		label: '';
		borderWidth: 0;   
		onClickWithBlock: [self controller routerController navigateTo: '/home'];
		yourself.
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:22'
}
SLGAbstractPage >> createResetButton [

	^ PluggableButtonMorph new onColor: Color veryVeryLightGray offColor: Color white;
		 label: 'Reset';
		 textColor: Color veryLightGray;
		 borderColor: Color white;
		 borderWidth: 0;
		 cornerStyle: #rounded;
		 target: self;
		 actionSelector: #resetAction;
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:26'
}
SLGAbstractPage >> createTitleTextMorph: aString [ 
	
	^ SLGTextGen new setText: aString;
		 color: Color black;
		 setFontSize: self class scoreFontSize px;
		 center: self body center - (self body width * self class titlePositionWidthRatio @ 0);
		 top: self body top + (self body height * self class titlePositionHeightRatio);
		 yourself
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:35'
}
SLGAbstractPage >> displayExperiencePoint [
	
	| cheeseImg marginwidth marginHeight |
	cheeseImg := self loadImageAssetwith: '/assets/cheese-30.png'.	
	self scoreDisplay: (self scoreDisplaySetupWith: self score).
	
	marginwidth := (self class iconMarginWidth) px.
	marginHeight := (self class iconMarginHeight) px.
	cheeseImg addMorph: self scoreDisplay.
	cheeseImg center: (self header center 
		- (marginwidth * self class cheeseIconWidthMarginRatio @ 0) 
		+ (0 @ marginHeight * self class scoreDisplayMarginHeightRatio)).
 	self scoreDisplay center: (cheeseImg center + (marginwidth * self class scoreDisplayMarginWidthRatio @ 0)).
	self header addMorph: cheeseImg
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:36'
}
SLGAbstractPage >> displayMainBadge [
	
	| badgeImg marginwidth marginHeight |
	badgeImg := self loadImageAssetwith: '/assets/badge-gold-30.png'.		
	self topicScoreDisplay: (self scoreDisplaySetupWith: 0).	
	
	marginwidth := (self class iconMarginWidth) px.
	marginHeight := (self class iconMarginHeight) px.
	badgeImg addMorph: self topicScoreDisplay.
	badgeImg center: self header center 
		+ (marginwidth * self class mainBadgeIconWidthMarginRatio @ marginHeight  * self class scoreDisplayMarginHeightRatio).
 	self topicScoreDisplay center: badgeImg center + (marginwidth * self class scoreDisplayMarginWidthRatio @ 0).
	self header addMorph: badgeImg

]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:40'
}
SLGAbstractPage >> displaySetup [
	
	(self class scoreDisplayWidth) px; 
				setFontSize: (self class scoreFontSize) px;
				color: Color orange.
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:36'
}
SLGAbstractPage >> displaySubBadge [
	
	| badgeImg marginwidth marginHeight |
	badgeImg := self loadImageAssetwith: '/assets/badge-silver-30.png'.		
	self subtopicScoreDisplay: (self scoreDisplaySetupWith: 0).
	
	marginwidth := (self class iconMarginWidth) px.
	marginHeight := (self class iconMarginHeight) px.
	badgeImg addMorph: self subtopicScoreDisplay.
	badgeImg center: self header center 
		+ (0 @ marginHeight  * self class scoreDisplayMarginHeightRatio) 
		- (marginwidth * self class subBadgeIconWidthMarginRatio @ 0).
 	self subtopicScoreDisplay center: badgeImg center + (marginwidth * self class scoreDisplayMarginWidthRatio @ 0).
	self header addMorph: badgeImg

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
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:27'
}
SLGAbstractPage >> hideBackButton [

	self backButton hide.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:07'
}
SLGAbstractPage >> initialize [
	
	super initialize.
	self userProgress: SLGUserProgress userData;
		score: self userProgress score;
		subtopicScore: self userProgress subtopicScore;
		topicScore: self userProgress topicScore;
		addBasePage;
		addHeaderBodyFooter;
		addAllButtonsAndDisplay
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:06'
}
SLGAbstractPage >> loadImageAssetwith: aImageFile [ 

	^ (((GitAssetLoader for: 'SqueakLanguageLearning')
		loadForm: aImageFile)
		magnifyBy: 1 px) asMorph
]

{
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:31'
}
SLGAbstractPage >> navigateBack [
 
	self controller navigateBack.
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:25'
}
SLGAbstractPage >> refresh [
	"This method gets called everytime, when we navigate to this page with SLGRouter"
	
	self updateScoreDisplay.
	self updateSubtopicScoreDisplay.
	self updateTopicScoreDisplay.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:25'
}
SLGAbstractPage >> resetAction [

	SLGUserProgress reset.
	self controller routerController navigateTo: '/home'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:50'
}
SLGAbstractPage >> score [
	^ score
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:50'
}
SLGAbstractPage >> score: anObject [
	score := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:49'
}
SLGAbstractPage >> scoreDisplay [
	^ scoreDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:49'
}
SLGAbstractPage >> scoreDisplay: anObject [
	scoreDisplay := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:06'
}
SLGAbstractPage >> scoreDisplaySetupWith: aScore [ 

	^ SLGMultilineTextGen new setText: aScore asString;
		 width: self class scoreDisplayWidth px;
		 setFontSize: self class scoreFontSize px;
		 color: Color orange;
		 yourself
]

{
	#category : #actions,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:25'
}
SLGAbstractPage >> showBackButton [
	
	self backButton show.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:51'
}
SLGAbstractPage >> subtopicScore [
	^ subtopicScore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:51'
}
SLGAbstractPage >> subtopicScore: anObject [
	subtopicScore := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:37'
}
SLGAbstractPage >> subtopicScoreDisplay [
	^ subtopicScoreDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 01:37'
}
SLGAbstractPage >> subtopicScoreDisplay: anObject [
	subtopicScoreDisplay := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:51'
}
SLGAbstractPage >> topicScore [
	^ topicScore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:51'
}
SLGAbstractPage >> topicScore: anObject [
	topicScore := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:29'
}
SLGAbstractPage >> topicScoreDisplay [
	^ topicScoreDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:29'
}
SLGAbstractPage >> topicScoreDisplay: anObject [
	topicScoreDisplay := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:32'
}
SLGAbstractPage >> updateScoreDisplay [
	
	self score: (SLGUserProgress userData score).
	self scoreDisplay setText: self score asString
]

{
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:32'
}
SLGAbstractPage >> updateSubtopicScoreDisplay [
	
	self subtopicScore: SLGUserProgress userData subtopicScore.
	self subtopicScoreDisplay setText: self subtopicScore asString.
	
	Transcript show: 'You have  completed ', self subtopicScore, ' subtopics!'; cr
]

{
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/11/2024 02:32'
}
SLGAbstractPage >> updateTopicScoreDisplay [
	
	self  topicScore: SLGUserProgress userData topicScore.
	self topicScoreDisplay setText: self topicScore asString.
	
	Transcript show: 'You have completed ', self topicScore, ' topics!'; cr
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:56'
}
SLGAbstractPage >> userProgress [
	^ userProgress
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:56'
}
SLGAbstractPage >> userProgress: anObject [
	userProgress := anObject
]
