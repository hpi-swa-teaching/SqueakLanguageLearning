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
	#'squeak_changestamp' : 'yegi 7/9/2024 12:32'
}
SLGAbstractPage class >> buttonHeight [

	^ 30 px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:51'
}
SLGAbstractPage class >> buttonWidth [

	^ 200 px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:52'
}
SLGAbstractPage class >> descriptionFont [

	^ 17.5 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:52'
}
SLGAbstractPage class >> descriptionMargin [

	^ 55 px
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
	#'squeak_changestamp' : 'yegi 7/9/2024 12:32'
}
SLGAbstractPage class >> gapHeight [

	^ 15 px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:32'
}
SLGAbstractPage class >> homeBorderWidth [

	^ 3 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:32'
}
SLGAbstractPage class >> homeButtonHeightMargin [

	^ 10 px
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
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> homeCornerRadius [

	^ 15 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> iconMarginHeight [

	^ 100 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> iconMarginWidth [

	^ 100 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> lessonCornerRadius [

	^ 10 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> margin [

	^ 2 px
	
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
	#'squeak_changestamp' : 'yegi 7/9/2024 12:33'
}
SLGAbstractPage class >> nextButtonHeight [

	^ 25 px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:53'
}
SLGAbstractPage class >> pageHeight [

	^ 662.2 px
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
	#'squeak_changestamp' : 'yegi 7/9/2024 15:53'
}
SLGAbstractPage class >> pageWidth [

	^ 882.2 px
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
	#'squeak_changestamp' : 'yegi 7/9/2024 15:28'
}
SLGAbstractPage class >> scoreDisplayWidth [

	^ 150 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:28'
}
SLGAbstractPage class >> scoreFontSize [

	^ 20 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:28'
}
SLGAbstractPage class >> smallButtonWidth [

	^ 60 px
	
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
	#'squeak_changestamp' : 'yegi 7/9/2024 15:38'
}
SLGAbstractPage class >> taskViewExtent [

	^ (1200 @ 800) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:29'
}
SLGAbstractPage class >> topicGapHeight [

	^ 11 px
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:04'
}
SLGAbstractPage class >> topicPageColumnCenterMargin [

	^ 0.3
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:22'
}
SLGAbstractPage >> addBackButton [

	| backButton |
	backButton := SLGNavigationButtonGen new
		label: 'Back';
		borderColor: Color orange;
		width: self class smallButtonWidth;
		height: self class buttonHeight;
		onClickWithBlock: [
			self controller routerController navigateBack.];
		yourself.
	
	backButton center: self header leftCenter 
							+ ((backButton width)/2 @ 0) 
							+ ((self header height - backButton height)/2 @ 0).
	self backButton: backButton.
	self header addMorph: backButton
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:22'
}
SLGAbstractPage >> addCloseButton [

	| closeButton |	
	closeButton := SLGNavigationButtonGen new
		label: 'Close';
		width: self class smallButtonWidth;
		borderColor: Color orange;
		height: self class buttonHeight;
		onClickWithBlock: [
			self controller routerController closeWindow.];
		yourself.
	
	closeButton center: self header rightCenter 
							- ((closeButton width)/2 @ 0) 
							- ((self header height - closeButton height)/2 @ 0).
	
	self header addMorph: closeButton
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:26'
}
SLGAbstractPage >> addHomeButton [

	| imageMorph  homeButton  |
	homeButton := SLGNavigationButtonGen new
		color: Color transparent;
		label: '';
		borderWidth: 0;   
		onClickWithBlock: [
			self controller routerController navigateTo: '/home'.
		];
		yourself.
	
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
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:22'
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
					actionSelector: #resetAction;
					yourself.
				
	
	resetButton center: self footer center + (0 @ self class pageMargin * 3).
	
	self footer addMorph: resetButton
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:22'
}
SLGAbstractPage >> addTitle: aString [

	| title |
	title := SLGTextGen new
		setText: aString;
		color: Color black;
		setFontSize: 20px;
		center: self body center - (self body width * 0.03 @ 0) ;
		top: self body top + (self body height * 0.04);
		yourself.
		

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
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 7/9/2024 16:49'
}
SLGAbstractPage >> controller: anObject [
	controller := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:26'
}
SLGAbstractPage >> displayExperiencePoint [
	
	| cheeseImg marginwidth marginHeight |
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
	
	self header addMorph: cheeseImg
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:16'
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
	
	marginwidth := self class iconMarginWidth.
	marginHeight := self class iconMarginHeight.
	badgeImg addMorph: topicScoreDisplay.
	badgeImg center: self header center + (marginwidth * 3 @ marginHeight  * 0.2).
 	topicScoreDisplay center: badgeImg center + (marginwidth * 0.95 @ 0).
	
	self header addMorph: badgeImg

]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 7/9/2024 15:16'
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
	
	marginwidth := self class iconMarginWidth.
	marginHeight := self class iconMarginHeight.
	badgeImg addMorph: subtopicScoreDisplay.
	badgeImg center: self header center + (0 @ marginHeight  * 0.2) - (marginwidth * 0.05 @ 0).
 	subtopicScoreDisplay center: badgeImg center + (marginwidth * 0.95 @ 0).
	
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 7/10/2024 11:55'
}
SLGAbstractPage >> initialize [
	
	| width height margin |
	super initialize.
	self userProgress: SLGUserProgress userData.
	
	self 
		score: self userProgress score;
		subtopicScore: self userProgress subtopicScore;
		topicScore: self userProgress topicScore.
	
	width := self class pageWidth.
	height := self class pageHeight.
	margin := self class margin.
	
	self extent: width@height;
		color: Color white; 
		center: Display center.
			
	self header: (Morph new
		width: self width - (2 * margin);
		height: (12 * (self height - (2 * margin)))/100; 
		position: self position + (margin asPoint);
		color: Color white;
		yourself).	
		
	self body: (Morph new
		width: self width - 50px;
		height: (83 * (self height - (2 * margin)))/100; 
		position: self position;
		cornerStyle: #rounded;
		cornerRadius: 20;
		center: self center + (0 @ self header height * 0.3); 
		color: self class softYellow;
		yourself). 
		
	self footer: (Morph new
		width: self width - (2 * margin);
		height: (5 * (self height - (2 * margin)))/100; 
		position: self position + (margin @ (self header height + self body height + margin));
		color: Color white;
		yourself).
		
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

		
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'EB 6/3/2024 00:08'
}
SLGAbstractPage >> navigateBack [
 
	controller navigateBack.
	
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
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:27'
}
SLGAbstractPage >> updateScoreDisplay [
	
	score := SLGUserProgress userData score.
	scoreDisplay setText: score asString
]

{
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:27'
}
SLGAbstractPage >> updateSubtopicScoreDisplay [
	
	subtopicScore := SLGUserProgress userData subtopicScore.
	subtopicScoreDisplay setText: subtopicScore asString.
	
	Transcript show: 'You have  completed ', subtopicScore, ' subtopics!'; cr
]

{
	#category : #updating,
	#'squeak_changestamp' : 'yegi 7/9/2024 14:27'
}
SLGAbstractPage >> updateTopicScoreDisplay [
	
	topicScore := SLGUserProgress userData topicScore.
	topicScoreDisplay setText: topicScore asString.
	
	Transcript show: 'You have completed ', topicScore, ' topics!'; cr
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
