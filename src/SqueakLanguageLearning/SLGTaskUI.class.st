Class {
	#name : #SLGTaskUI,
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
	#'squeak_changestamp' : 'SW 5/31/2024 09:24'
}
SLGTaskUI class >> taskDescription [
	
	self subclassResponsibility
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 09:59'
}
SLGTaskUI >> createSubmitButton [

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
	#'squeak_changestamp' : 'SW 5/31/2024 10:05'
}
SLGTaskUI >> createTextFieldWithContent: aString [
	"Currently unused. User createTextFieldWithContent:withBorder: instead"
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
SLGTaskUI >> createTextFieldWithContent: aString withBorder: aBoolean [

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
SLGTaskUI >> descriptionField [
	^ descriptionField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:48'
}
SLGTaskUI >> descriptionField: anObject [
	descriptionField := anObject
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 5/31/2024 09:33'
}
SLGTaskUI >> initialize [

	super initialize.
	
	self
		extent: 1000@600;
		color: Color white.
		
	"self description: (self createTextFieldWithContent: self class taskDescription).
	self question: (self createTextFieldWithContent: self taskQuestion).
	self status: (self createTextFieldWithContent: '')"
	
		

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:50'
}
SLGTaskUI >> questionField [
	^ questionField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:50'
}
SLGTaskUI >> questionField: anObject [
	questionField := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:03'
}
SLGTaskUI >> setup [

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
SLGTaskUI >> status [
	^ status
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/30/2024 16:08'
}
SLGTaskUI >> status: anObject [
	status := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:17'
}
SLGTaskUI >> task [
	^ task
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:18'
}
SLGTaskUI >> task: aSLGTask [
	task := aSLGTask
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:29'
}
SLGTaskUI >> taskQuestion [
	^ taskQuestion
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 09:29'
}
SLGTaskUI >> taskQuestion: anObject [
	taskQuestion := anObject
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 5/30/2024 14:37'
}
SLGTaskUI >> validate [

	self subclassResponsibility
	
	
]
