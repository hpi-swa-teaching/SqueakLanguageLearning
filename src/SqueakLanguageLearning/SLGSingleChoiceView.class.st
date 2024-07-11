"
This class is the UI of single choice task template.
"
Class {
	#name : #SLGSingleChoiceView,
	#superclass : #SLGBaseChoiceView,
	#category : #'SqueakLanguageLearning-Tasks',
	#'squeak_changestamp' : 'xiaoshi 7/7/2024 19:03'
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
