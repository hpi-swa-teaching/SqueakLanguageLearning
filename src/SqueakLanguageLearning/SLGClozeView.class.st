Class {
	#name : #SLGClozeView,
	#superclass : #SLGTaskView,
	#instVars : [
		'taskCloze',
		'clozeField'
	],
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:34'
}
SLGClozeView class >> errorMessage [

	^ 'Please change xx to your answer.'
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'SW 5/31/2024 10:41'
}
SLGClozeView class >> newClozeUIwithTask: aSLGClozeTask [

 	^ self new
		task: aSLGClozeTask;
		taskQuestion: aSLGClozeTask question;
		taskCloze: aSLGClozeTask cloze;
		setup;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 5/31/2024 10:11'
}
SLGClozeView class >> taskDescription [

	^ 'Fill in the gaps.'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:42'
}
SLGClozeView >> clozeField [
	^ clozeField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:42'
}
SLGClozeView >> clozeField: aTextMorph [
	clozeField := aTextMorph
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:59'
}
SLGClozeView >> createCloze [

	self clozeField: (self createClozeFieldWithContent: self task cloze).
	self clozeField center: (self center).
	
	self addMorph: clozeField
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:59'
}
SLGClozeView >> createClozeFieldWithContent: aString [

	| textField |
	textField := TextMorph new.
	textField
		contents:  aString;
		wrapFlag: true;
		borderWidth: 2;
		borderColor: Color green;
		extent: 600@0.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 13:56'
}
SLGClozeView >> passUserInput [
	
	^ self clozeField contents asString.
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 5/31/2024 10:43'
}
SLGClozeView >> setup [

	super setup.
	
	self createCloze
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 5/31/2024 10:40'
}
SLGClozeView >> taskCloze [
	^ taskCloze
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SW 6/7/2024 12:25'
}
SLGClozeView >> taskCloze: aString [
	taskCloze := aString
]
