Class {
	#name : #SLGMultipleChoiceView,
	#superclass : #SLGBaseChoiceView,
	#category : #'SqueakLanguageLearning-Tasks'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'EB 6/5/2024 22:50'
}
SLGMultipleChoiceView class >> newMultipleChoiceUIwithTask: aSLGMultipleChoiceTask [

 	^ self new
		task: aSLGMultipleChoiceTask;
		taskQuestion: aSLGMultipleChoiceTask question;
		setup";".
		"yourself"
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/8/2024 14:06'
}
SLGMultipleChoiceView >> printFailure [

	self printFailureWithPercentage: self result
]

{
	#category : #validation,
	#'squeak_changestamp' : 'SW 6/1/2024 14:50'
}
SLGMultipleChoiceView >> printFailureWithPercentage: aPercentage [

	self status contents: ((self class failureMessage), ' [', aPercentage asString, '% correct]')
	
	
]
