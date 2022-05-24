Class {
	#name : #AHSortingComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'selectedSpeciesName',
		'selectedSex',
		'selectedBreedName'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
AHSortingComponent >> initialize [
	super initialize.
	selectedSpeciesName := Species list at: 1.
	selectedSex := Sex list at: 1.
	selectedBreedName := (Species breedsOf: selectedSpeciesName) asArray at: 1.
]

{ #category : #rendering }
AHSortingComponent >> renderBreedLinkOn: html with: breed [
	html dropdownItem 
		class: 'active' if: breed = self selectedBreedName;
		callback: [ self selectBreed: breed ]; with: breed.
]

{ #category : #rendering }
AHSortingComponent >> renderContentOn: html [
		html dropdown 
		style: 'margin: 10px';
		with: [ 
		html formButton 
			bePrimary;
			beLarge;
			dropdown;
			dataToggle: 'dropdown';
			with: selectedSpeciesName.
		html dropdownMenu 
		attributeAt: 'aria-labelledby' put: 'navbarDropdown';
		with: [ 
			Species list collect: [ :species | self renderSpeciesLinkOn: html with: species ].
		].
	].
	html dropdown 
		style: 'margin: 10px';
		with: [ 
		html formButton 
			bePrimary;
			beLarge;
			dropdown;
			dataToggle: 'dropdown';
			with: selectedSex.
		html dropdownMenu 
		attributeAt: 'aria-labelledby' put: 'navbarDropdown';
		with: [ 
			Sex list collect: [ :sex | self renderSexLinkOn: html with: sex ].
		].
	].
	html dropdown 
		style: 'margin: 10px';
		with: [ 
		html formButton 
			bePrimary;
			beLarge;
			dropdown;
			dataToggle: 'dropdown';
			with: selectedBreedName.
		html dropdownMenu
		attributeAt: 'aria-labelledby' put: 'navbarDropdown';
		with: [ 
			(Species breedsOf: selectedSpeciesName) collect: [ :breed | self renderBreedLinkOn: html with: breed ].
		].
	].
]

{ #category : #rendering }
AHSortingComponent >> renderSexLinkOn: html with: sex [
	html dropdownItem 
		class: 'active' if: sex = self selectedSex;
		callback: [ self selectSex: sex ]; with: sex.
]

{ #category : #rendering }
AHSortingComponent >> renderSpeciesLinkOn: html with: species [
	html dropdownItem 
		class: 'active' if: species = self selectedSpeciesName;	
		callback: [ self selectSpecies: species ]; with: species.
]

{ #category : #actions }
AHSortingComponent >> selectBreed: breed [
	selectedBreedName := breed.
]

{ #category : #actions }
AHSortingComponent >> selectSex: sex [
	selectedSex := sex.
]

{ #category : #actions }
AHSortingComponent >> selectSpecies: species [
	selectedSpeciesName = species ifTrue: [ ^ self ] 
		ifFalse: [  
			selectedSpeciesName := species.
			selectedBreedName := (Species breedsOf: species) asArray at: 1.
		].
]

{ #category : #accessing }
AHSortingComponent >> selectedBreedName [

	^ selectedBreedName
]

{ #category : #accessing }
AHSortingComponent >> selectedSex [

	^ selectedSex
]

{ #category : #accessing }
AHSortingComponent >> selectedSpeciesName [

	^ selectedSpeciesName
]
