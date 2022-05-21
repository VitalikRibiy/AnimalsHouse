Class {
	#name : #Species,
	#superclass : #Object,
	#category : #'AnimalsHouse-Enums'
}

{ #category : #accessing }
Species class >> breedsOf: aSpecies [
	| aSet |
	aSet := ((Breed selectAll select: [ :breed | breed species = aSpecies ]) collect: [ :breed | breed name ]) asSet.
	^ aSet.
]

{ #category : #accessing }
Species class >> cat [
	^ 'Cat'.
]

{ #category : #accessing }
Species class >> dog [
	^ 'Dog'.
]

{ #category : #accessing }
Species class >> list [
	^ OrderedCollection with: self cat with: self dog.
]
