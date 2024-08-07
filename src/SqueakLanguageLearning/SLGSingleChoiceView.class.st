"
This class provides the UI for single choice.
"
Class {
	#name : #SLGSingleChoiceView,
	#superclass : #SLGBaseChoiceView,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'SW 7/11/2024 15:33'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:33'
}
SLGSingleChoiceView class >> errorMessage [

	^ 'Please choose an answer.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/10/2024 09:33'
}
SLGSingleChoiceView class >> isSingleChoice [

	^ true
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 00:32'
}
SLGSingleChoiceView class >> newSingleChoiceUIwithTask: aSLGSingleChoiceTask [

 	^ self new
		task: aSLGSingleChoiceTask;
		code: aSLGSingleChoiceTask code;
		taskQuestion: aSLGSingleChoiceTask question;
		setup;
		yourself
]
