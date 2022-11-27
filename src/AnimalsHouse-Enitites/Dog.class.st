"
Represents concreate class of animal
"
Class {
	#name : #Dog,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #initialization }
Dog >> initialize [

	super initialize.
	animalSpecies := Species dog.

]

{ #category : #testing }
Dog >> isCat [
	^ false.
]

{ #category : #testing }
Dog >> isDog [
	^ true.
]
