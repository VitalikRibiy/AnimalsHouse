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
	html row with: [ html column extraLargeSize:6; extraLargeOffset: 3; with: carousel. ].
	html row justifyContentCenterVeryLarge;
		with: [
		html column extraLargeSize: 2; with: FoundAnimalModal new.
		html column extraLargeSize: 2; with: WantAnimalModal new.
	 ].
	html row with: [ 
		html column extraLargeSize: 6; extraLargeOffset: 3; with: grid.
		 ].
	html row 
		with: footer.
]
