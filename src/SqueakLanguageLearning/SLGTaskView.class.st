Class {
	#name : #SLGTaskView,
	#superclass : #Morph,
	#instVars : [
		'status',
		'taskQuestion',
		'task',
		'result',
		'code',
		'headerLowerBound'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

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
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:53'
}
SLGTaskView class >> pageExtent [

	^ ((1604 * 0.55) px) @ ((1204 * 0.55) px)
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
	#'squeak_changestamp' : 'xiaoshi 6/14/2024 13:54'
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
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 17:15'
}
SLGTaskView >> checkResult [

	(self result = 100)
		ifTrue: [self printSuccess]
		ifFalse: [self printFailure]
	
		
	
	
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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 16:41'
}
SLGTaskView >> createCodeBlockWithContent: aCodeString withBorder: aBoolean [

	|codeField|

	codeField := (ToolBuilder build:
			(Workspace new
				contents: (aCodeString copyReplaceAll: '\n' with: '', Character cr,'');
				buildCodePaneWith: ToolBuilder default))
				wrapFlag: true;
				extent: self class taskElementWidth @ 300.

	(aBoolean)
		ifTrue: [codeField
					borderWidth: 2;
					borderColor: Color veryLightGray].	
	
	self addMorph: codeField.
	
	^ codeField
	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:45'
}
SLGTaskView >> createSubmitButton [

	| submitButton margin|
	submitButton := SimpleButtonMorph new.
	margin := self class taskElementsMargin.
	submitButton 
			label: 'Submit';
			on: #mouseUp send: #verifyAnswer to: self.
	
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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:44'
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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 17:59'
}
SLGTaskView >> initialize [

	super initialize.
	
	self
		extent: self class taskViewExtent;
		color: Color veryVeryLightGray;
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
	#'squeak_changestamp' : 'xiaoshi 6/12/2024 18:01'
}
SLGTaskView >> setupWith: anInteractiveMorph [

	| submitbutton descriptionField questionField codeField fieldsArray fieldColumns|
	
	submitbutton := self createSubmitButton.
	descriptionField := (self createTextFieldWithContent: self class taskDescription withBorder: true).
	self status: (self createTextFieldWithContent: '' withBorder: true).
	self taskQuestion ifNotNil: [
		questionField := (self createTextFieldWithContent: self taskQuestion withBorder: true)].
	self code ifNotNil: [
		codeField := (self createCodeBlockWithContent: self code withBorder: true)].
	
	fieldsArray := OrderedCollection new.
	
	fieldsArray add: submitbutton; add: status; add: anInteractiveMorph.
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
	#'squeak_changestamp' : 'SW 6/9/2024 21:09'
}
SLGTaskView >> verifyAnswer [

	| userInput |
	userInput := self passUserInput.
	self result: (self task verifyAnswer: userInput).
	
	(self result = -1)
		ifTrue: [self printError]
		ifFalse: [self checkResult]
		
	
	
]
