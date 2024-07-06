"
This class tests the correct handling of completed tasks.
"
Class {
	#name : #SLGUserProgressTest,
	#superclass : #TestCase,
	#instVars : [
		'originalProgress',
		'progress'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/6/2024 14:04'
}

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 13:57'
}
SLGUserProgressTest >> setUp [ 

	super setUp.
	
	progress := SLGUserProgress new
]

{
	#category : #running,
	#'squeak_changestamp' : 'SW 7/6/2024 14:20'
}
SLGUserProgressTest >> tearDown [

	SLGUserProgress reset.
	progress := nil.
	
	super tearDown
]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:48'
}
SLGUserProgressTest >> testMarkTaskAsCompleted [

        progress markTaskAsCompleted: 1.

        self assert: (progress completed includes: 1).
        self assert: progress score = 10

]

{
	#category : #tests,
	#'squeak_changestamp' : 'SW 7/6/2024 13:48'
}
SLGUserProgressTest >> testMarkTaskAsCompletedTwice [ 

        progress markTaskAsCompleted: 1.
        progress markTaskAsCompleted: 1.

        self assert: progress score = 10.
        self assert: (progress completed select: [:each | each = 1]) size = 1
 
]
