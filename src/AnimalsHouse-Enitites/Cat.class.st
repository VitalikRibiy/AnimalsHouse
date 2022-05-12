"
Represents concreat class of Animal
"
Class {
	#name : #Cat,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
Cat >> isCat [
	^ true.
]

{ #category : #testing }
Cat >> isDog [
	^ false.
]
