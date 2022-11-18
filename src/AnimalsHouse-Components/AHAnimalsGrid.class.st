Class {
	#name : #AHAnimalsGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAnimalsGrid >> children [
	^ { sorting }
]

{ #category : #accessing }
AHAnimalsGrid >> getData [
	^ (Animal selectAll select: [ :animal | (animal sex = sorting selectedSex) and: 
														((sorting selectedSpeciesName = animal animalSpecies) and: 
														(sorting selectedBreedName = (animal breed name))) ])
		 collect: [ :filteredAnimal | (AHAnimalCard from: self component) animal: filteredAnimal ].

]

{ #category : #accessing }
AHAnimalsGrid >> initialize [
	super initialize.
	sorting := AHSortingComponent new.
]
