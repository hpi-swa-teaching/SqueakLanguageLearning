Class {
	#name : #SLGUserProgressTest,
	#superclass : #TestCase,
	#instVars : [
		'progress'
	],
	#category : #'SqueakLanguageLearning-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 15:33'
}
SLGUserProgressTest >> setUp [ 
        progress := SLGUserProgress new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 15:45'
}
SLGUserProgressTest >> testMarkTaskAsCompleted [

        progress markTaskAsCompleted: 1.
        self assert: (progress completed includes: 1).
        self assert: progress score = 10.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/17/2024 15:46'
}
SLGUserProgressTest >> testMarkTaskAsCompletedTwice [ 

        progress markTaskAsCompleted: 1.
        progress markTaskAsCompleted: 1.

        self assert: progress score = 10.
        self assert: (progress completed select: [:each | each = 1]) size = 1.
 
]
