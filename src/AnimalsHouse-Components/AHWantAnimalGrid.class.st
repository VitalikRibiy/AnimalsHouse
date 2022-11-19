Class {
	#name : #AHWantAnimalGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHWantAnimalGrid >> getData [
	^ AHWantAnimal selectAll collect: [ :request | AHWantAnimalCard from: component withData: request ].
]
