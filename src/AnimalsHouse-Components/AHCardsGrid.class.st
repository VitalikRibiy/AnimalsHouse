Class {
	#name : #AHCardsGrid,
	#superclass : #SBSComponent,
	#instVars : [
		'animalsComponents',
		'sorting'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHCardsGrid >> animalsComponents [
	animalsComponents := Animal selectAll collect: [ :each | AHAnimalCard new animal: each ].
	^ animalsComponents.
]

{ #category : #accessing }
AHCardsGrid >> animalsComponentsSpecies: speciesValue breed: breedValue sex: sexValue [
	animalsComponents := (Animal selectAll select: [ :animal | (animal sex = sexValue) and: ((speciesValue = animal class name) and: (breedValue = (animal breed name))) ])
		 collect: [ :filteredAnimal| AHAnimalCard new animal: filteredAnimal ].
	^ animalsComponents.
]

{ #category : #accessing }
AHCardsGrid >> initialize [
	super initialize.
	sorting := AHSortingComponent new.
	animalsComponents := OrderedCollection new.
]

{ #category : #rendering }
AHCardsGrid >> renderContentOn: html [
	html column
		style: 'background: #6F9DC8';
		extraLargeSize: 12; 
		with: [ 
			html row
				style: 'background: #2e608f';
				with: sorting.
			html row with: [ 
				(self animalsComponentsSpecies: sorting selectedSpeciesName breed: sorting selectedBreedName sex: sorting selectedSex) 
					collect: [ :a | html column extraLargeSize: 3; with: a ]
			]
		].
]
