"
Represents concreate class of breed
"
Class {
	#name : #DogBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #accessing }
DogBreed >> animalSpecies [
	^ Species dog.
]
