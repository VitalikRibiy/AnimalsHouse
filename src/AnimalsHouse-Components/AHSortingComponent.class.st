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
	selectedSpeciesName := 'Вид'.
	selectedSex := 'Стать'.
	selectedBreedName := 'Порода'.
]

{ #category : #rendering }
AHSortingComponent >> renderBreedLinkOn: html with: breed [
	html dropdownItem 
		class: 'active' if: breed = self selectedBreedName;
		callback: [ self selectBreed: breed ]; with: breed.
]

{ #category : #rendering }
AHSortingComponent >> renderContentOn: html [

	html container
		style: 'display: inline-flex';
		with: [ 
			html container
				style: 'display: inline-flex; justify-content: space-evenly; padding: 10px';
				with: [ 
					html dropdown with: [ 
							html formButton
								bePrimary;
								beLarge;
								dropdown;
								dataToggle: 'dropdown';
								with: selectedSpeciesName.
							html dropdownMenu
								attributeAt: 'aria-labelledby' put: 'navbarDropdown';
								with: [ 
									(Species list collect: [ :species | 
											 self renderSpeciesLinkOn: html with: species ]) addFirst:
											'Вид' ] ].
					html dropdown with: [ 
						html formButton
							bePrimary;
							beLarge;
							dropdown;
							dataToggle: 'dropdown';
							with: selectedSex.
						html dropdownMenu
							attributeAt: 'aria-labelledby' put: 'navbarDropdown';
							with: [ 
								(Sex list collect: [ :sex | 
										 self renderSexLinkOn: html with: sex ]) addFirst: 'Стать' ] ].
					html dropdown with: [ 
						html formButton
							class: 'disabled' if: selectedSpeciesName = 'Вид';
							bePrimary;
							beLarge;
							dropdown;
							dataToggle: 'dropdown';
							with: selectedBreedName.
						html dropdownMenu
							attributeAt: 'aria-labelledby' put: 'navbarDropdown';
							with: [ 
								((Species breedsOf: selectedSpeciesName) collect: [ :breed | 
										 self renderBreedLinkOn: html with: breed ]) addFirst:
										'Порода' ] ] ].
			html container
				style: 'justify-content: end; display: inline-flex;padding: 10px;';
				with: [ 
					html formButton
						bePrimary;
						beLarge;
						style: '';
						with: 'Очистити фільтрування';
						callback: [  ] ] ]
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
