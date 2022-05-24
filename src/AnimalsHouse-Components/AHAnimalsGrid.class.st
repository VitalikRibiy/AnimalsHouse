Class {
	#name : #AHAnimalsGrid,
	#superclass : #SBSComponent,
	#instVars : [
		'sorting'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAnimalsGrid >> animalsComponents [
	^ Animal selectAll collect: [ :each | AHAnimalCard new animal: each ].

]

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
AHAnimalsGrid >> initialize [
	super initialize.
	sorting := AHSortingComponent new.
]

{ #category : #rendering }
AHAnimalsGrid >> renderContentOn: html [
	html column
		style: 'background: #6F9DC8 min-height: 100%';
		extraLargeSize: 12;
		mediumSize: 12;
		smallSize: 12;
		with: [ 
			html row
				style: 'background: #2e608f';
				with: sorting.
			html row with: [ 
				(self animalsComponentsSpecies: sorting selectedSpeciesName breed: sorting selectedBreedName sex: sorting selectedSex) 
					collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; with: a ]
			]
		].
]
