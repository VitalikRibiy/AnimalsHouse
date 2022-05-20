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

{ #category : #accessing }
AHSortingComponent >> breedsOfSpecies: aSpecies [
	^ ((Breed selectAll select: [ :breed| breed species = aSpecies ]) collect: [ :breed| breed name ]) asSet.
]

{ #category : #initialization }
AHSortingComponent >> initialize [
	super initialize.
	selectedSpeciesName := self species at: 1.
	selectedSex := self sexList at: 1.
	selectedBreedName := (self breedsOfSpecies: selectedSpeciesName) asArray at: 1.
]

{ #category : #rendering }
AHSortingComponent >> renderBreedLinkOn: html with: breed [
	html listGroupLinkedItem callback: [ self selectBreed: breed ]; with: breed.
]

{ #category : #rendering }
AHSortingComponent >> renderContentOn: html [
	html listGroup: [ 
		self species collect: [ :species| self renderSpeciesLinkOn: html with: species ].
	].
	html listGroup: [ 
		self sexList collect: [ :sex| self renderSexLinkOn: html with: sex ].
	].
	html listGroup: [ 
		(self breedsOfSpecies: selectedSpeciesName) collect: [ :breed| self renderBreedLinkOn: html with: breed ].
	].
]

{ #category : #rendering }
AHSortingComponent >> renderSexLinkOn: html with: sex [
	html listGroupLinkedItem callback: [ self selectSex: sex ]; with: sex.
]

{ #category : #rendering }
AHSortingComponent >> renderSpeciesLinkOn: html with: species [
	html listGroupLinkedItem callback: [ self selectSpecies: species ]; with: species.
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
	selectedSpeciesName := species.
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

{ #category : #accessing }
AHSortingComponent >> sexList [
	^ OrderedCollection with: Sex male with: Sex female.
]

{ #category : #accessing }
AHSortingComponent >> species [
	^ OrderedCollection with: Species dog with: Species cat.
]
