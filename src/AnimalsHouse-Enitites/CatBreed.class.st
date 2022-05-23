"
Represents concreat class of breeed
"
Class {
	#name : #CatBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #accessing }
CatBreed >> animalSpecies [
	^ Species cat.
]
