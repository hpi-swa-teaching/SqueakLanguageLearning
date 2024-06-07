Class {
	#name : #SLGTaskView,
	#superclass : #Morph,
	#instVars : [
		'status',
		'taskQuestion',
		'descriptionField',
		'questionField',
		'task'
	],
	#classInstVars : [
		'taskDescription'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/1/2024 14:46'
}
SLGTaskView class >> failureMessage [

	^ 'Wrong Answer!'
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
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:48'
}
SLGTaskView >> descriptionField [
	^ descriptionField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:48'
}
SLGTaskView >> descriptionField: anObject [
	descriptionField := anObject
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 6/7/2024 11:09'
}
SLGTaskView >> initialize [

	super initialize.
	
	self
		extent: 1000@600;
		color: Color veryVeryLightGray;
		center: World bounds center
		
	"self description: (self createTextFieldWithContent: self class taskDescription).
	self question: (self createTextFieldWithContent: self taskQuestion).
	self status: (self createTextFieldWithContent: '')"
	
		

	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 10:14'
}
SLGTaskView >> printFailure [

	self status contents: self class failureMessage.
	Transcript show: self class failureMessage; cr.
	
	
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/7/2024 10:15'
}
SLGTaskView >> printSuccess [

	self status contents: self class successMessage.
	Transcript show: self class successMessage; cr.
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:50'
}
SLGTaskView >> questionField [
	^ questionField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:50'
}
SLGTaskView >> questionField: anObject [
	questionField := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:03'
}
SLGTaskView >> setup [

	self createSubmitButton.
	
	self descriptionField: (self createTextFieldWithContent: self class taskDescription withBorder: true).
	self questionField: (self createTextFieldWithContent: self taskQuestion withBorder: true).
	self status: (self createTextFieldWithContent: '' withBorder: true).
	
	self descriptionField center: (self topCenter + (0 @ 50)).
	self questionField center: (self descriptionField center + (0 @ 50)).
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
	#'squeak_changestamp' : 'SW 5/30/2024 16:08'
}
SLGTaskView >> status: anObject [
	status := anObject
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
	#'squeak_changestamp' : 'SW 5/31/2024 09:29'
}
SLGTaskView >> taskQuestion: anObject [
	taskQuestion := anObject
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/30/2024 14:37'
}
SLGTaskView >> validate [

	self subclassResponsibility
	
	
]
