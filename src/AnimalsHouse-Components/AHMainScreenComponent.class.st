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
	html render: carousel.
	html render: FoundAnimalModal new.
	html render: WantAnimalModal new.
	html render: grid.
]
