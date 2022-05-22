Class {
	#name : #Species,
	#superclass : #Object,
	#category : #'AnimalsHouse-Enums'
}

{ #category : #accessing }
Species class >> breedsOf: aSpecies [

	| speciesClass |
	speciesClass := aSpecies = self dog
		                ifTrue: [ DogBreed ]
		                ifFalse: [ CatBreed ].
	^ speciesClass selectAll collect: [ :breed | breed name ]
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
