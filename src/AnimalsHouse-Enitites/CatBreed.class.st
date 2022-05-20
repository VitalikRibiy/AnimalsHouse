"
Represents concreat class of breeed
"
Class {
	#name : #CatBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'class initialization' }
CatBreed class >> initialize [
	breeds := OrderedCollection new.
]

{ #category : #private }
CatBreed >> species [
	^ 'Cat'.
]
