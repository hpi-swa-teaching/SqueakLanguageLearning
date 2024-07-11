"
This class provides the UI for the cloze task type.
"
Class {
	#name : #SLGClozeView,
	#superclass : #SLGTaskView,
	#instVars : [
		'taskCloze',
		'clozeField'
	],
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:32'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/20/2024 12:14'
}
SLGClozeView class >> clozeContainerHeight [
	
	^ 40px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/20/2024 01:58'
}
SLGClozeView class >> clozeHeight [
	
	^ 0px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'yegi 6/20/2024 02:00'
}
SLGClozeView class >> clozeMargin [
	
	^ 11px
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:34'
}
SLGClozeView class >> errorMessage [

	^ 'Please change xx to your answer.'
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:32'
}
SLGClozeView class >> newClozeUIwithTask: aSLGClozeTask [

 	^ self new
		task: aSLGClozeTask;
		code: aSLGClozeTask code;
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
	#'squeak_changestamp' : 'SW 7/11/2024 14:17'
}
SLGClozeView >> createCloze [

	| clozeFieldContainer |	
		
	self clozeField: (self createClozeFieldWithContent: self task cloze).
	
	 clozeFieldContainer := Morph new					
						extent: self class taskElementWidth @ self class clozeContainerHeight;					
						color: Color white;					
						cornerStyle: #rounded;					
						borderWidth: 1px;				
						borderColor: self class paperBasic.		 
								
	clozeFieldContainer addMorph: self clozeField.	
	self clozeField position:  clozeFieldContainer topLeft.	
	self addMorph:  clozeFieldContainer.	
		
	^ clozeFieldContainer


	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'yegi 6/20/2024 12:15'
}
SLGClozeView >> createClozeFieldWithContent: aString [

	| textField |
	textField := TextMorph new.
	textField
		contents:  aString;
		wrapFlag: true;
		borderWidth: 2px;
		margins: self class clozeMargin;
		borderColor: Color transparent;
		extent: self class taskElementWidth @ 0.
	
	self addMorph: textField.
	
	^ textField

	
	
	
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 7/11/2024 14:03'
}
SLGClozeView >> passUserInput [
	
	^ self clozeField contents asString
	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SW 7/11/2024 14:27'
}
SLGClozeView >> setup [

	|interactive|
	interactive := self createCloze.
	
	super setupWith: interactive
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
