"
Represents concreate class of breed
"
Class {
	#name : #DogBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'class initialization' }
DogBreed class >> initialize [
	breeds := OrderedCollection new.
]

{ #category : #accessing }
DogBreed >> animalSpecies [
	^ Species dog.
]
