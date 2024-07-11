"
This class is an abstraction for all different displays of task types in SqueakLanguageLearning.
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
	#'squeak_changestamp' : 'SW 7/11/2024 15:31'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:40'
}
SLGTaskView class >> codeFieldBorderWidth [

	^ 2 px
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:41'
}
SLGTaskView class >> statusFieldBorderWidth [

	^ 3 px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:14'
}
SLGTaskView class >> statusFieldMargin [

	^20px @ 15px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:42'
}
SLGTaskView class >> submitButtonBorderWidth [

	^ 0 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/11/2024 17:42'
}
SLGTaskView class >> submitButtonCornerRadius [
	^ 10 px
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:39'
}
SLGTaskView class >> success [

	^ 100
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
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:33'
}
SLGTaskView >> addCodeFieldTo: anArray [

	| codeField |
	
	self code ifNotNil: [
		codeField := (self createCodeBlockWithContent: self code withBorder: true).
		anArray add: codeField].

]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:33'
}
SLGTaskView >> addQuestionFieldTo: anArray [

	| questionField |
	
	self taskQuestion ifNotNil: [
		questionField := (self createTextFieldWithContent: self taskQuestion withBorder: true).
		anArray add: questionField]

]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 17:39'
}
SLGTaskView >> checkResult [

	(self result = self class success)
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
	#'squeak_changestamp' : 'SW 7/11/2024 17:39'
}
SLGTaskView >> code: aString [
	code := aString
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:40'
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
					borderWidth: self class codeFieldBorderWidth;
					borderColor: Color veryLightGray].	
	
	self addMorph: codeField.
	
	^ codeField
	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:41'
}
SLGTaskView >> createStatusField [

	| statusField |
	
	self status: (self createTextFieldWithContent: '' withBorder: false).
	self status wrapFlag: false.
	
	statusField := Morph new 
					extent: self class taskElementWidth @ self class textContainerHeight;
					color: self class paperBasic;
					cornerStyle: #rounded;
					borderWidth: self class statusFieldBorderWidth;
					borderColor: Color orange.
					
	statusField addMorph: self status.
	self status position: statusField topLeft + self class statusFieldMargin.
	
	self addMorph: statusField.
	
	^ statusField
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:42'
}
SLGTaskView >> createSubmitButton [

	| submitButton |
	submitButton := PluggableButtonMorph new.
	submitButton 
			label: 'Submit';
			textColor: Color white;
			onColor: Color white offColor: SLGAbstractPage pastelGreen;
			borderColor: Color white;
			borderWidth: self class submitButtonBorderWidth;
			width: self class submitButtonWidth;
			height: self class submitButtonHeight;
			center: self bottomCenter;
			cornerStyle: #rounded;
			cornerRadius: self class submitButtonCornerRadius;
			target: self;
			actionSelector: #verifyAnswer.
	
	self addMorph: submitButton.
	
	^ submitButton
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:34'
}
SLGTaskView >> createTextFieldWithContent: aString withBorder: aBoolean [

	| textField |
	textField := TextMorph new
		contents:  aString;
		wrapFlag: true;
		extent: self class taskElementWidth @ 0;
		lock.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/11/2024 15:51'
}
SLGTaskView >> initialize [

	super initialize.
	
	self
		extent: self class taskViewExtent;
		color: Color transparent;
		cornerStyle: #rounded
	
		


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
	#'squeak_changestamp' : 'SW 7/11/2024 17:43'
}
SLGTaskView >> result: aNumber [
	result := aNumber
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 17:34'
}
SLGTaskView >> setupWith: anInteractiveMorph [

	| submitbutton descriptionField fieldsArray fieldColumns |
	
	submitbutton := self createSubmitButton.
	descriptionField := (self createTextFieldWithContent: self class taskDescription withBorder: true).
	self statusDisplay: self createStatusField.

	fieldsArray := OrderedCollection new.
	fieldsArray  
		add: submitbutton;
		add: self statusDisplay;
		add: anInteractiveMorph.

	self addQuestionFieldTo: fieldsArray.
	self addCodeFieldTo: fieldsArray.
	fieldsArray add: descriptionField.

	fieldColumns := SLGLayout columnWithMorphsReversed: fieldsArray withGap: (self class taskElementsMargin).	
	fieldColumns center: self center.
	
	self addMorph: fieldColumns
	
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
