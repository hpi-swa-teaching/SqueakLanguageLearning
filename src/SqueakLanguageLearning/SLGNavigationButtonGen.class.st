"
This class is used for all buttons supporting navigation tools like going back to the previous page or forward to the next page. These buttons differ in look from the other buttons used in SqueakLanguageLearning.
"
Class {
	#name : #SLGNavigationButtonGen,
	#superclass : #SLGButtonGen,
	#category : #'SqueakLanguageLearning-UI-Components',
	#'squeak_changestamp' : 'SW 7/5/2024 10:40'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:58'
}
SLGNavigationButtonGen class >> buttonBorderColor [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:59'
}
SLGNavigationButtonGen class >> buttonColor [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'SW 7/5/2024 09:51'
}
SLGNavigationButtonGen class >> buttonCornerRadius [

	^ 20
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'SW 7/5/2024 09:59'
}
SLGNavigationButtonGen >> initialize [

	super initialize.
	
	self 
		color: self class buttonColor;
		borderWidth: self class buttonBorderWidth;
		borderColor: self class buttonBorderColor;
		cornerStyle: #rounded;
		cornerRadius: self class buttonCornerRadius
]
