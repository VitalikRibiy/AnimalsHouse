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

	^ (Animal selectAll select: [ :animal | 
		   animal status = AnimalStatus inShelter and:
			   ((animal sex = sorting selectedSex or:
				     sorting selectedSex = 'Стать') and:
				    ((sorting selectedSpeciesName = animal animalSpecies or:
					      sorting selectedSpeciesName = 'Вид') and:
					     (sorting selectedBreedName = animal breed name or:
						      sorting selectedBreedName = 'Порода'))) ]) collect: [ 
		  :filteredAnimal | 
		  AHAnimalCard from: self component withData: filteredAnimal ]
]

{ #category : #accessing }
AHAnimalsGrid >> initialize [
	super initialize.
	sorting := AHSortingComponent new.
]
