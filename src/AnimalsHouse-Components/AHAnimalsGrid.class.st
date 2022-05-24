Class {
	#name : #AHAnimalsGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAnimalsGrid >> animalsComponentsSpecies: speciesValue breed: breedValue sex: sexValue [
	^ (Animal selectAll select: [ :animal | (animal sex = sexValue) and: ((speciesValue = animal animalSpecies) and: (breedValue = (animal breed name))) ])
		 collect: [ :filteredAnimal | AHAnimalCard new animal: filteredAnimal ].
]

{ #category : #accessing }
AHAnimalsGrid >> children [
	^ { sorting }
]

{ #category : #accessing }
AHAnimalsGrid >> getData [
	^ self animalsComponentsSpecies: sorting selectedSpeciesName breed: sorting selectedBreedName sex: sorting selectedSex

]

{ #category : #accessing }
AHAnimalsGrid >> initialize [
	super initialize.
	sorting := AHSortingComponent new.
]
