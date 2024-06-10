Class {
	#name : #SLGSingleChoiceView,
	#superclass : #SLGBaseChoiceView,
	#category : #'SqueakLanguageLearning-Tasks'
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
	#'squeak_changestamp' : 'SW 6/1/2024 13:16'
}
SLGSingleChoiceView class >> newSingleChoiceUIwithTask: aSLGSingleChoiceTask [

 	^ self new
		task: aSLGSingleChoiceTask;
		taskQuestion: aSLGSingleChoiceTask question;
		setup;
		yourself
]
