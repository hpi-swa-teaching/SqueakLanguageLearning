Class {
	#name : #SubtopicPage,
	#superclass : #Page,
	#instVars : [
		'lessonPages'
	],
	#category : #'MyOwnCategory-Pages'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:20'
}
SubtopicPage >> createLessonPagesFor: aSubtopic [

        | lessons button |
        lessons := self lessonsForSubtopic: aSubtopic.
        lessons withIndexDo: [:lesson :index |
            | lessonPage |
            lessonPage := LessonPage new.
            lessonPage addTitle: lesson.
            lessonPage addBackButton.
            lessonPages at: lesson put: lessonPage.

            button := SimpleButtonMorph new label: lesson.
            button position: (self position + (500@(index * 75))).
            button target: self.
            button actionSelector: #navigateToLesson:.
            button arguments: { lesson }.
            self addMorph: button.
        ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 21:34'
}
SubtopicPage >> initialize [ 

        super initialize.
        self addBackButton.
	lessonPages := Dictionary new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 23:20'
}
SubtopicPage >> lessonsForSubtopic: aSubtopic [ 
        "Return a list of lessons for the given sub-topic. This is a placeholder implementation."
        ^#('Lesson 1' 'Lesson 2' 'Lesson 3')
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 5/23/2024 21:53'
}
SubtopicPage >> navigateToLesson: aLesson [

        | lessonPage |
        lessonPage := lessonPages at: aLesson.
        self owner allMorphsDo: [:morph |
            (morph isKindOf: Page) ifTrue: [ morph hide ].
        ].
        self owner addMorph: lessonPage.
        lessonPage show.
]
