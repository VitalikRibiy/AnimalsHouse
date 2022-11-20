Class {
	#name : #AHWantAnimalGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHWantAnimalGrid >> getData [

	^ (AHWantAnimal selectAll select: [ :request | 
		   request animal status = AnimalStatus inShelter ]) collect: [ 
		  :filteredRequest | 
		  AHWantAnimalCard from: component withData: filteredRequest ]
]
