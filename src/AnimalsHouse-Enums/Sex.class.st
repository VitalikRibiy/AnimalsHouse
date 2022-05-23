Class {
	#name : #Sex,
	#superclass : #Object,
	#category : #'AnimalsHouse-Enums'
}

{ #category : #initialization }
Sex class >> female [
	^ 'Самка'.
]

{ #category : #accessing }
Sex class >> list [
	^ OrderedCollection with: self male with: self female.
]

{ #category : #initialization }
Sex class >> male [
	^ 'Самець'.
]
