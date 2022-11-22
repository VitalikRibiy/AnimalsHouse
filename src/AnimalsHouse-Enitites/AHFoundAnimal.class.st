Class {
	#name : #AHFoundAnimal,
	#superclass : #Object,
	#instVars : [
		'id',
		'photo',
		'description',
		'place',
		'contactName',
		'contactPhone',
		'animalSpecies'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHFoundAnimal class >> isVoyageRoot [
	^ true.
]

{ #category : #'as yet unclassified' }
AHFoundAnimal class >> withSpecies: species contactName: contactName contactPhone: phone animalPhoto: photoValue animalDescription: description animalPlace: place [
	| instance |
	instance := self new.
	instance animalSpecies: species; contactName: contactName; contactPhone: phone; 
	photo: photoValue; description: description; place: place.
	instance save.
	^ instance.
]

{ #category : #accessing }
AHFoundAnimal >> animalSpecies [

	^ animalSpecies
]

{ #category : #accessing }
AHFoundAnimal >> animalSpecies: anObject [

	animalSpecies := anObject
]

{ #category : #accessing }
AHFoundAnimal >> contactName [

	^ contactName
]

{ #category : #accessing }
AHFoundAnimal >> contactName: anObject [

	contactName := anObject
]

{ #category : #accessing }
AHFoundAnimal >> contactPhone [

	^ contactPhone
]

{ #category : #accessing }
AHFoundAnimal >> contactPhone: anObject [

	contactPhone := anObject
]

{ #category : #accessing }
AHFoundAnimal >> description [

	^ description
]

{ #category : #accessing }
AHFoundAnimal >> description: anObject [

	description := anObject
]

{ #category : #accessing }
AHFoundAnimal >> id [

	^ self voyageId value printStringHex
]

{ #category : #accessing }
AHFoundAnimal >> photo [

	^ photo
]

{ #category : #accessing }
AHFoundAnimal >> photo: anObject [

	photo := anObject
]

{ #category : #accessing }
AHFoundAnimal >> place [

	^ place
]

{ #category : #accessing }
AHFoundAnimal >> place: anObject [

	place := anObject
]
