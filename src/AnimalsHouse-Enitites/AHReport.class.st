Class {
	#name : #AHReport,
	#superclass : #Object,
	#instVars : [
		'animal',
		'user',
		'image',
		'comment',
		'date'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
AHReport class >> withAnimal: animalObject user: userObject image: imageObject comment: commentObject date: dateObject [

	| instance |
	instance := self new.
	instance
		animal: animalObject;
		user: userObject;
		image: imageObject;
		comment: commentObject;
		date: dateObject;
		save.
	^ instance.
]

{ #category : #accessing }
AHReport >> animal [

	^ animal
]

{ #category : #accessing }
AHReport >> animal: anObject [

	animal := anObject
]

{ #category : #accessing }
AHReport >> comment [

	^ comment
]

{ #category : #accessing }
AHReport >> comment: anObject [

	comment := anObject
]

{ #category : #accessing }
AHReport >> date [

	^ date
]

{ #category : #accessing }
AHReport >> date: anObject [

	date := anObject
]

{ #category : #accessing }
AHReport >> image [

	^ image
]

{ #category : #accessing }
AHReport >> image: anObject [

	image := anObject
]

{ #category : #accessing }
AHReport >> user [

	^ user
]

{ #category : #accessing }
AHReport >> user: anObject [

	user := anObject
]
