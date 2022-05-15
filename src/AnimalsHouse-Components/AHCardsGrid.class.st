Class {
	#name : #AHCardsGrid,
	#superclass : #WAComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHCardsGrid >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [  
		Animal selectAll do: [ :a |
			html render: (AHAnimalCard new animal: a) ]
		]

]
