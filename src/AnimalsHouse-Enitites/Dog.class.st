"
Represents concreate class of animal
"
Class {
	#name : #Dog,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
Dog >> isCat [
	^ false.
]

{ #category : #testing }
Dog >> isDog [
	^ true.
]
