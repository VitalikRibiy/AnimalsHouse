Class {
	#name : #AHFoundAnimal,
	#superclass : #Object,
	#instVars : [
		'photo',
		'description',
		'place',
		'contactName',
		'contactPhone'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHFoundAnimal class >> isVoyageRoot [
	^ true.
]

{ #category : #'as yet unclassified' }
AHFoundAnimal class >> withContactName: contactName contactPhone: phone animalPhoto: photoValue animalDescription: description animalPlace: place [
	| instance |
	instance := self new.
	instance contactName: contactName; contactPhone: phone; photo: photoValue; description: description; place: place.
	instance save.
	^ instance.
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
