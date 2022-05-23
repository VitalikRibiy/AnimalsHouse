"
Represents concreat class of Animal
"
Class {
	#name : #Cat,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #initialization }
Cat >> initialize [
	animalSpecies := Species cat.
]

{ #category : #testing }
Cat >> isCat [
	^ true.
]

{ #category : #testing }
Cat >> isDog [
	^ false.
]
