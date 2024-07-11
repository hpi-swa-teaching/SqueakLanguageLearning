"
This class is the abstract interface for all task views.
"
Class {
	#name : #SLGTaskView,
	#superclass : #Morph,
	#instVars : [
		'status',
		'taskQuestion',
		'task',
		'result',
		'code',
		'headerLowerBound',
		'statusDisplay'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 19:02'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/15/2024 19:31'
}
SLGTaskView class >> baseChoiceButtonExtent [

	^(25px  @  25px)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/16/2024 04:03'
}
SLGTaskView class >> codeFieldHeight [

	^180px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:30'
}
SLGTaskView class >> errorMessage [

	self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/7/2024 12:22'
}
SLGTaskView class >> failureMessage [

	^ 'Wrong Answer! Please try again.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/16/2024 05:44'
}
SLGTaskView class >> lightPastelGreen [
	^Color r: 0.78 g: 1 b: 0.7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/16/2024 05:42'
}
SLGTaskView class >> lightPastelRed [
	^Color r: 1 g: 0.7 b: 0.7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:53'
}
SLGTaskView class >> pageExtent [

	^ ((1604 * 0.55) px) @ ((1204 * 0.55) px)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/20/2024 01:37'
}
SLGTaskView class >> paperBasic [	
	
	^ Color r: 0.98 g: 0.96 b: 0.91
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/16/2024 03:58'
}
SLGTaskView class >> pastelRed [
	^Color r: 1 g: 0.4 b: 0.4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/19/2024 19:47'
}
SLGTaskView class >> statusFieldMargine [

	^20px @ 15px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 21:45'
}
SLGTaskView class >> submitButtonHeight [

	^30px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/15/2024 21:44'
}
SLGTaskView class >> submitButtonWidth [

	^60px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/1/2024 14:46'
}
SLGTaskView class >> successMessage [

	^ 'Success!'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/31/2024 09:24'
}
SLGTaskView class >> taskDescription [
	
	self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:53'
}
SLGTaskView class >> taskElementWidth [

	^ (1000 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 14:06'
}
SLGTaskView class >> taskElementsMargin [

	^ (25 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:54'
}
SLGTaskView class >> taskViewExtent [

	^( 1400 * 0.55) px @ (900 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:54'
}
SLGTaskView class >> taskViewMargin [

	^ (130 * 0.55) px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/19/2024 20:20'
}
SLGTaskView class >> textContainerHeight [

	^50px
]

{
	#category : #verification,
	#'squeak_changestamp' : 'EB 7/1/2024 15:16'
}
SLGTaskView >> checkResult [

	(self result = 100)
		ifTrue: [self printSuccess.
			self statusDisplay color: self class lightPastelGreen.
			(SLGUserProgress userData isTaskCompleted: (self task id) ) ifFalse: [
				SLGUserProgress userData markTaskAsCompleted: (self task id).
				self task triggerEvent: #taskCompleted. ] ]
		
		ifFalse: [self printFailure.
			self statusDisplay color: self class lightPastelRed]
	
		
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:30'
}
SLGTaskView >> code [
	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:30'
}
SLGTaskView >> code: anObject [
	code := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 7/1/2024 09:21'
}
SLGTaskView >> createCodeBlockWithContent: aCodeString withBorder: aBoolean [

	|codeField|

	codeField := (ToolBuilder build:
			(Workspace new
				contents: (aCodeString copyReplaceAll: '\n' with: '', Character cr,'');
				buildCodePaneWith: ToolBuilder default))
				wrapFlag: true;
				extent: self class taskElementWidth @ self class codeFieldHeight.

	(aBoolean)
		ifTrue: [codeField
					borderWidth: 2;
					borderColor: Color veryLightGray].	
	
	self addMorph: codeField.
	
	^ codeField
	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/19/2024 20:21'
}
SLGTaskView >> createStatusField [

	| statusField |
	
	self status: (self createTextFieldWithContent: '' withBorder: false).
	self status wrapFlag: false.
	
	statusField := Morph new 
					extent: self class taskElementWidth @ self class textContainerHeight;
					color: self class paperBasic;
					cornerStyle: #rounded;
					borderWidth: 3px;
					borderColor: Color orange.
					
	statusField addMorph: status.
	status position: statusField topLeft + self class statusFieldMargine.
	
	self addMorph: statusField.
	
	^statusField

	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/19/2024 23:07'
}
SLGTaskView >> createSubmitButton [

	| submitButton margin |
	submitButton := PluggableButtonMorph new.
	margin := self class taskElementsMargin.
	submitButton 
			label: 'Submit';
			textColor: Color white;
			onColor: Color white offColor: SLGAbstractPage pastelGreen;
			borderColor: Color white;
			borderWidth: 0;
			width: self class submitButtonWidth;
			height: self class submitButtonHeight;
			center: self bottomCenter;
			cornerStyle: #rounded;
			cornerRadius: 10px;
			target: self;
			actionSelector: #verifyAnswer.
	
	self addMorph: submitButton.
	
	^ submitButton
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:44'
}
SLGTaskView >> createTextFieldWithContent: aString [
	"Currently unused. Use createTextFieldWithContent:withBorder: instead"
	| textField |
	textField := TextMorph new.
	textField
		contents:  aString;
		wrapFlag: true;
		extent: 600@0;
		"borderWidth: 2;"
		"borderColor: Color veryLightGray;"
		lock.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/16/2024 05:04'
}
SLGTaskView >> createTextFieldWithContent: aString withBorder: aBoolean [

	| textField |
	textField := TextMorph new.
	
"	(aBoolean)
		ifTrue: [textField
					borderWidth: 2;
					borderColor: Color veryLightGray].	"
	textField
		contents:  aString;
		wrapFlag: true;
		extent: self class taskElementWidth @ 0;
		lock.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'yegi 6/15/2024 13:01'
}
SLGTaskView >> initialize [

	super initialize.
	
	self
		extent: self class taskViewExtent;
		color: Color transparent;
		cornerStyle: #rounded;
		"color: Color veryVeryLightGray;"
		center: World bounds center
	
		

	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 13:55'
}
SLGTaskView >> passUserInput [

	self subclassResponsibility
	
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:00'
}
SLGTaskView >> printError [

	self status contents: self class errorMessage
	
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/7/2024 12:21'
}
SLGTaskView >> printFailure [

	self status contents: self class failureMessage
	
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/7/2024 12:21'
}
SLGTaskView >> printSuccess [

	self status contents: self class successMessage
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/8/2024 14:05'
}
SLGTaskView >> result [
	^ result
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/8/2024 14:05'
}
SLGTaskView >> result: anObject [
	result := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:52'
}
SLGTaskView >> setup [
	"use setupWith instead"
	| descriptionField questionField codeField fieldsArray currentY|
	self extent: self class taskViewExtent. "1200@800"
	self createSubmitButton.
	
	descriptionField := (self createTextFieldWithContent: self class taskDescription withBorder: true).
	self status: (self createTextFieldWithContent: '' withBorder: true).
	self taskQuestion ifNotNil: [
		questionField := (self createTextFieldWithContent: self taskQuestion withBorder: true)].
	self code ifNotNil: [
		codeField := (self createCodeBlockWithContent: self code withBorder: true)].
	
	
	fieldsArray := OrderedCollection new.
	fieldsArray add: descriptionField.
	self taskQuestion ifNotNil: [fieldsArray add: questionField].
	self code ifNotNil: [fieldsArray add: codeField].

	"Position each field"
	currentY := self topCenter y.
	fieldsArray do: [:element |
		| elementHeight elementTop |
		element ifNotNil: [
			elementHeight := element height.
			elementTop := currentY + self class taskElementsMargin.
			element topLeft: (self center x - (element width / 2))  @ elementTop.
			currentY := elementTop + elementHeight.
			self headerLowerBound: currentY + elementHeight.
		].
	].
	
	self status center: (self bottomCenter - (0 @ self class taskViewMargin)).	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/19/2024 19:38'
}
SLGTaskView >> setupWith: anInteractiveMorph [

	| submitbutton descriptionField questionField codeField fieldsArray fieldColumns "statusField" |
	
	submitbutton := self createSubmitButton.
	descriptionField := (self createTextFieldWithContent: self class taskDescription withBorder: true).

	self statusDisplay: (self createStatusField).
	self taskQuestion ifNotNil: [
		questionField := (self createTextFieldWithContent: self taskQuestion withBorder: true)].
	self code ifNotNil: [
		codeField := (self createCodeBlockWithContent: self code withBorder: true)].
	
	fieldsArray := OrderedCollection new.
	
	fieldsArray add: submitbutton; add: statusDisplay; add: anInteractiveMorph.
	self code ifNotNil: [fieldsArray add: codeField].
	self taskQuestion ifNotNil: [fieldsArray add: questionField].
	fieldsArray add: descriptionField.
	
	fieldColumns := SLGLayout columnWithMorphsReversed: fieldsArray withGap: (self class taskElementsMargin).	
	fieldColumns center: self center.
	
	self addMorph: fieldColumns.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/30/2024 16:08'
}
SLGTaskView >> status [
	^ status
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/7/2024 12:24'
}
SLGTaskView >> status: aTextMorph [
	status := aTextMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/16/2024 05:37'
}
SLGTaskView >> statusDisplay [
	^statusDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'yegi 6/16/2024 05:36'
}
SLGTaskView >> statusDisplay: anObject [
	statusDisplay:= anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:17'
}
SLGTaskView >> task [
	^ task
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:18'
}
SLGTaskView >> task: aSLGTask [
	task := aSLGTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:29'
}
SLGTaskView >> taskQuestion [
	^ taskQuestion
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/7/2024 12:24'
}
SLGTaskView >> taskQuestion: aString [
	taskQuestion := aString
]

{
	#category : #verification,
	#'squeak_changestamp' : 'yegi 6/19/2024 23:25'
}
SLGTaskView >> verifyAnswer [

	| userInput |
	userInput := self passUserInput.
	self result: (self task verifyAnswer: userInput).
	"self result: (self task verifyAnswer: userInput 
						 andAddCompleted: self task). "
	
	(self result = -1)
		ifTrue: [self printError]
		ifFalse: [self checkResult]
		
	
	
]
