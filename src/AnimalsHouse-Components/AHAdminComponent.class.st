Class {
	#name : #AHAdminComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'grid'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
AHAdminComponent >> createHeaderComponent [
	^ AHAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
AHAdminComponent >> goToMainView [
	self answer
]

{ #category : #initialization }
AHAdminComponent >> initialize [
	super initialize.
	grid := AHFoundAnimalCardsGrid new.
]

{ #category : #rendering }
AHAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html column
		style: 'height: 100%';
		extraLargeSize: 12; 
		with: [
			html heading: 'Reports'.
			html row 
				with: [ 
					html column extraLargeSize: 8; extraLargeOffset: 2; 
						mediumSize: 10; mediumOffset:1;
						with: grid.
				].
		].
	
]
