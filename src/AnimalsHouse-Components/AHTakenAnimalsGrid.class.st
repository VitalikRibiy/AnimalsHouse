Class {
	#name : #AHTakenAnimalsGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHTakenAnimalsGrid >> getData [

	^ (Animal selectAll select: [ :animal | 
		   animal status = AnimalStatus taken ]) collect: [ :filteredAnimal | 
		  AHTakenAnimalCard from: self component withData: filteredAnimal ]
]
