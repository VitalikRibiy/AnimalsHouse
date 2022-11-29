Class {
	#name : #ReviewType,
	#superclass : #Object,
	#category : #'AnimalsHouse-Enums'
}

{ #category : #accessing }
ReviewType class >> list [

	^ { self positive. self negative }
]

{ #category : #testing }
ReviewType class >> negative [

	^ 'Негативний'
]

{ #category : #testing }
ReviewType class >> positive [

	^ 'Позитивний'
]
