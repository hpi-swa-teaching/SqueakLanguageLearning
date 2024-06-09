Class {
	#name : #SLGTaskView,
	#superclass : #Morph,
	#instVars : [
		'status',
		'taskQuestion',
		'task',
		'code'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/7/2024 12:22'
}
SLGTaskView class >> failureMessage [

	^ 'Wrong Answer! Please try again.'
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
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:42'
}
SLGTaskView >> createCodeBlockWithContent: aCodeString withBorder: aBoolean [

	|codeField|

	codeField := (ToolBuilder build:
			(Workspace new
				contents: aCodeString;
				buildCodePaneWith: ToolBuilder default))
				wrapFlag: true;
				extent: 600@400; "automatically change size based on the size of input?"
				lock. "why lock?"
	(aBoolean)
		ifTrue: [codeField
					borderWidth: 2;
					borderColor: Color veryLightGray].	
	
	self addMorph: codeField.
	
	^ codeField
	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 09:59'
}
SLGTaskView >> createSubmitButton [

	| submitButton |
	submitButton := SimpleButtonMorph new.
	submitButton 
			label: 'Submit';
			center: (self bottomRight + (-100@(-70)));
			on: #mouseUp send: #validate to: self.
	
	self addMorph: submitButton
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 6/7/2024 10:47'
}
SLGTaskView >> createTextFieldWithContent: aString [
	"Currently unused. Use createTextFieldWithContent:withBorder: instead"
	| textField |
	textField := TextMorph new.
	textField
		contents:  aString;
		wrapFlag: true;
		extent: 600@0;
		borderWidth: 2;
		borderColor: Color veryLightGray;
		lock.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:02'
}
SLGTaskView >> createTextFieldWithContent: aString withBorder: aBoolean [

	| textField |
	textField := TextMorph new.
	
	(aBoolean)
		ifTrue: [textField
					borderWidth: 2;
					borderColor: Color veryLightGray].	
	textField
		contents:  aString;
		wrapFlag: true;
		extent: 600@0;
		lock.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 6/7/2024 12:24'
}
SLGTaskView >> initialize [

	super initialize.
	
	self
		extent: 1000@600;
		color: Color veryVeryLightGray;
		center: World bounds center
	
		

	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 12:21'
}
SLGTaskView >> printFailure [

	self status contents: self class failureMessage
	
	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 12:21'
}
SLGTaskView >> printSuccess [

	self status contents: self class successMessage
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:47'
}
SLGTaskView >> setup [

	| descriptionField questionField codeField topBound|
	self createSubmitButton.
	
	descriptionField := (self createTextFieldWithContent: self class taskDescription withBorder: true).
	self status: (self createTextFieldWithContent: '' withBorder: true).
	
	"if a task does not have code, then SLGWhateverTask code = nil. Same with question"
	
	self code ifNotNil: [codeField := (self createCodeBlockWithContent: self code withBorder: true).].
	self taskQuestion ifNotNil: [questionField := (self createTextFieldWithContent: self taskQuestion withBorder: true)].
	
	"layout: code - description - question - interactive - status (see miro)"
	topBound := self topCenter.
	codeField ifNotNil: [codeField center: (topBound + (0 @ 50)). 
		topBound += codeField topCenter]. 
	descriptionField center: (topBound + (0 @ 50)).
	questionField center: (descriptionField center + (0 @ 50)).

	self status center: (self bottomCenter - (0 @ 125))
	
	
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
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/30/2024 14:37'
}
SLGTaskView >> validate [

	self subclassResponsibility
	
	
]
