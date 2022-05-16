Class {
	#name : #AHMainScreenComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'carousel',
		'grid'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
AHMainScreenComponent >> initialize [
	super initialize.
	carousel := AHCarouselPhotos new.
	grid := AHCardsGrid new.
]

{ #category : #rendering }
AHMainScreenComponent >> renderContentOn: html [
	super renderContentOn: html.
	html column
		extraLargeSize: 12; with: [ 
		html row
			style: 'margin-top: 50px; margin-bottom: 50px;'; 
			with: [ html column extraLargeSize:6; extraLargeOffset: 3; with: carousel. ].
		html row justifyContentCenterVeryLarge;
			style: 'margin-top: 50px; margin-bottom: 50px;';
			with: [
			html column style: 'text-align: center'; extraLargeSize: 2; with: FoundAnimalModal new.
			html column style: 'text-align: center'; extraLargeSize: 2; with: WantAnimalModal new.
	 	].
		html row with: [ 
			html column extraLargeSize: 6; extraLargeOffset: 3; with: grid.
		].
		html row 
			with: [
			html column style: 'padding:0px; text-align: center'; extraLargeSize: 12; with: footer. ]
	]
]
