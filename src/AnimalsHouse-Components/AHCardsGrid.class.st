Class {
	#name : #AHCardsGrid,
	#superclass : #WAComponent,
	#instVars : [
		'animalsComponents'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHCardsGrid >> animalsComponents [
	animalsComponents := Animal selectAll collect: [ :each | AHAnimalCard new animal: each ].
	^ animalsComponents.
]

{ #category : #accessing }
AHCardsGrid >> initialize [
	super initialize.
	animalsComponents := OrderedCollection new.
]

{ #category : #rendering }
AHCardsGrid >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [  
		self animalsComponents do: [ :a |
			html render: a ]
	]
]
