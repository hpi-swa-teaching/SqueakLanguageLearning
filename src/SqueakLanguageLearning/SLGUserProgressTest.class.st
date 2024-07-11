"
This class tests the correct handling of completed tasks.
"
Class {
	#name : #SLGUserProgressTest,
	#superclass : #TestCase,
	#instVars : [
		'originalUserProgress',
		'mockUserProgress',
		'mockUserData'
	],
	#category : #'SqueakLanguageLearning-Tests',
	#'squeak_changestamp' : 'SW 7/6/2024 14:04'
}

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:43'
}
SLGUserProgressTest >> setUp [ 

	super setUp.
	
	originalUserProgress := SLGUserProgress userData copy.
	mockUserProgress := SLGUserProgress new.
	SLGUserProgress userData: mockUserProgress. 
	mockUserData := SLGUserProgress userData.
]

{
	#category : #running,
	#'squeak_changestamp' : 'EB 7/11/2024 22:44'
}
SLGUserProgressTest >> tearDown [

	SLGUserProgress userData: originalUserProgress.
	
	super tearDown
]

{
	#category : #tests,
	#'squeak_changestamp' : 'EB 7/11/2024 22:45'
}
SLGUserProgressTest >> testMarkTaskAsCompleted [

        mockUserData markTaskAsCompleted: 1.

        self assert: (mockUserData completed includes: 1).
        self assert: mockUserData score = 10

]

{
	#category : #tests,
	#'squeak_changestamp' : 'EB 7/11/2024 22:46'
}
SLGUserProgressTest >> testMarkTaskAsCompletedTwice [ 

        mockUserData markTaskAsCompleted: 1.
        mockUserData markTaskAsCompleted: 1.

        self assert: mockUserData score = 10.
        self assert: (mockUserData completed select: [:each | each = 1]) size = 1
 
]
