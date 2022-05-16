Class {
	#name : #AHCardsGrid,
	#superclass : #SBSComponent,
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
	html container
		style: 'background: #6F9DC8';
		with: [ 
		html row	with: [ 
				self animalsComponents do: [ :a |
					html column extraLargeSize: 3; with: a ]
			] 
	]
]
