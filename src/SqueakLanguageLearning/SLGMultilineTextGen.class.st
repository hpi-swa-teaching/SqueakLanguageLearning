Class {
	#name : #SLGMultilineTextGen,
	#superclass : #SLGTextGen,
	#category : #'SqueakLanguageLearning-UI-Components'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 16:05'
}
SLGMultilineTextGen class >> testMultilineText [
	| t |

	t := SLGMultilineTextGen new
		setText: 'asd asd as da sd asd as da sd asd as da sd as da sd as da sd as da da sda ds a sd ';
		width: 400.
	
	t openInHand.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alexander Netz 6/7/2024 15:58'
}
SLGMultilineTextGen >> initialize [
	super initialize.
	self wrapFlag: true.
	self lock.
]
