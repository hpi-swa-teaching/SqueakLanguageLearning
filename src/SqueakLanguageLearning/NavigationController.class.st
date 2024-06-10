Class {
	#name : #NavigationController,
	#superclass : #Object,
	#instVars : [
		'homePage',
		'topicPage',
		'subtopicPage',
		'lessonPage',
		'topics',
		'currentTopic',
		'currentSubtopic',
		'currentLesson'
	],
	#category : #'SqueakLanguageLearning-Controllers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 22:31'
}
NavigationController class >> newWithTopics: topics [

	^self basicNew initializeWithTopics: topics
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 13:56'
}
NavigationController >> handleLessonSelected: aLesson [

	currentLesson := aLesson.
	subtopicPage delete.
	"subtopicPage := nil."
	self showLessonPage: currentLesson.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 13:56'
}
NavigationController >> handleSubtopicSelected: aSubtopic [

	currentSubtopic := aSubtopic.
	topicPage delete.
	"topicPage := nil."
	self showSubtopicPage: currentSubtopic.
	
	
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 00:02'
}
NavigationController >> handleTopicSelected: aTopic [

	currentTopic := aTopic.
	homePage delete.
	homePage := nil.
	self showTopicPage: currentTopic.
	
	
	

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/2/2024 22:44'
}
NavigationController >> initializeWithTopics: topicsList [

	topics := topicsList.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/3/2024 14:53'
}
NavigationController >> navigateBack [
	
	currentLesson isNil not
		ifTrue: [
			currentLesson := nil.
			lessonPage delete.
			lessonPage := nil.
			self showSubtopicPage: currentSubtopic.
			]
		ifFalse: [
			currentSubtopic isNil not
					ifTrue: [
						currentSubtopic := nil.
						subtopicPage delete.
						subtopicPage := nil.
						self showTopicPage:currentTopic.
						]
					ifFalse: [
						currentTopic isNil not
							ifTrue: [
								currentTopic := nil.
								topicPage delete.
								topicPage := nil.
								self showHomepage.
								]
						]
					].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:26'
}
NavigationController >> showHomepage [

	"homePage := HomePageDynamic newWithTopics: topics andController: self."
	homePage := HomePageView newWithController: self.
	World addMorph: homePage. 
	
	
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:27'
}
NavigationController >> showLessonPage: aLesson [

	lessonPage := LessonPageView newWithLesson: aLesson andController: self.
	World addMorph: lessonPage.
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:27'
}
NavigationController >> showSubtopicPage: aSubtopic [

	subtopicPage := SubtopicPageView newWithSubtopic: aSubtopic andController: self.
	World addMorph: subtopicPage. 

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SW 6/6/2024 15:26'
}
NavigationController >> showTopicPage: aTopic [

	topicPage := TopicPageView newWithTopic: aTopic andController: self.
	World addMorph: topicPage. 

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/5/2024 14:50'
}
NavigationController >> topics [
	^ topics
]
