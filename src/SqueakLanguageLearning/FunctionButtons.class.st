Class {
	#name : #FunctionButtons,
	#superclass : #SLGButtons,
	#category : #SqueakLanguageLearning
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 13:44'
}
FunctionButtons >> closeButton [
    |closeButton|
"	closeButton := SimpleButtonMorph new."
      closeButton self new;

	label: 'Close';
	position: (0@0);
      on: #mouseUp send: #delete to: self owner.
    
    ^ closeButton.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'xiaoshi 5/13/2024 10:25'
}
FunctionButtons >> initialize [
	super initialize.
	
	
]
