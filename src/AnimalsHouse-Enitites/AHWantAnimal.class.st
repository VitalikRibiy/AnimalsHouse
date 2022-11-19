Class {
	#name : #AHWantAnimal,
	#superclass : #Object,
	#instVars : [
		'animal',
		'user'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHWantAnimal class >> isVoyageRoot [
	^ true.
]

{ #category : #'instance creation' }
AHWantAnimal class >> withAnimal: animal user: userObject [

	| instance |
	instance := self new.
	instance
		animal: animal;
		user: userObject;
		save.
	^ instance
]

{ #category : #accessing }
AHWantAnimal >> animal [

	^ animal
]

{ #category : #accessing }
AHWantAnimal >> animal: anObject [

	animal := anObject
]

{ #category : #accessing }
AHWantAnimal >> user [

	^ user
]

{ #category : #accessing }
AHWantAnimal >> user: anObject [

	user := anObject
]
