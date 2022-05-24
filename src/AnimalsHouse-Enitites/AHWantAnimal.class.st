Class {
	#name : #AHWantAnimal,
	#superclass : #Object,
	#instVars : [
		'contactName',
		'contactPhone',
		'animal'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHWantAnimal class >> isVoyageRoot [
	^ true.
]

{ #category : #'as yet unclassified' }
AHWantAnimal class >> withAnimal: animal contactName: nameValue contactPhone: phoneValue [
	| instance |
	instance := self new.
	instance animal: animal;
				contactName: nameValue;
				contactPhone: phoneValue;
				save.
	^ instance.
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
AHWantAnimal >> contactName [

	^ contactName
]

{ #category : #accessing }
AHWantAnimal >> contactName: anObject [

	contactName := anObject
]

{ #category : #accessing }
AHWantAnimal >> contactPhone [

	^ contactPhone
]

{ #category : #accessing }
AHWantAnimal >> contactPhone: anObject [

	contactPhone := anObject
]
