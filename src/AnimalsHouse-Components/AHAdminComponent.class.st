Class {
	#name : #AHAdminComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'foundAnimalGrid',
		'wantAnimalGrid'
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
	foundAnimalGrid := AHFoundAnimalGrid new.
	wantAnimalGrid := AHWantAnimalGrid new.
]

{ #category : #rendering }
AHAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html column
		style: 'min-height: 800px';
		extraLargeSize: 12; 
		with: [
			html row 
				with: [ 
					html column extraLargeSize: 1; with: [ html heading: 'Знайдені тварини' ].
					html column extraLargeSize: 10; with: [ 
						html column extraLargeSize: 8; extraLargeOffset: 2; 
								mediumSize: 10; mediumOffset:1;
								with: foundAnimalGrid. ]
				].
			html horizontalRule.
			html row 
				with: [
					html column extraLargeSize: 1; with: [ html heading: 'Заявки на отримання' ].
					html column extraLargeSize: 10; with: [
							html column extraLargeSize: 8; extraLargeOffset: 2; 
								mediumSize: 10; mediumOffset:1;
								with: wantAnimalGrid.
						].
				]
		].


	
	
]
