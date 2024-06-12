Class {
	#name : #SLGMultipleChoiceView,
	#superclass : #SLGBaseChoiceView,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/8/2024 16:33'
}
SLGMultipleChoiceView class >> errorMessage [

	^ 'Please choose at least one answer.'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 6/10/2024 09:33'
}
SLGMultipleChoiceView class >> isSingleChoice [

	^ false
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'xiaoshi 6/10/2024 10:07'
}
SLGMultipleChoiceView class >> newMultipleChoiceUIwithTask: aSLGMultipleChoiceTask [

 	^ self new
		task: aSLGMultipleChoiceTask;
		code: aSLGMultipleChoiceTask code;
		taskQuestion: aSLGMultipleChoiceTask question;
		setup;
		yourself
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/8/2024 14:06'
}
SLGMultipleChoiceView >> printFailure [

	self printFailureWithPercentage: self result
]

{
	#category : #verification,
	#'squeak_changestamp' : 'SW 6/1/2024 14:50'
}
SLGMultipleChoiceView >> printFailureWithPercentage: aPercentage [

	self status contents: ((self class failureMessage), ' [', aPercentage asString, '% correct]')
	
	
]
