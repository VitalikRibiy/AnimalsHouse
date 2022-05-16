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
	html column 
		style: 'background: #6F9DC8';
		extraLargeSize: 12; 
		with: [ 
			html row
				style: 'background: #2e608f';
				with: [  
				html navigationTabs with: [ 
					html navigationItem beActive; with: [ html anchor: 'All' ].
					html navigationItem: [ html anchor: 'Cats' ].
					html navigationItem: [ html anchor: 'Dogs' ].
				]
			].
			html row with: [ 
				self animalsComponents do: [ :a |
					html column extraLargeSize: 3; with: a ]
			]
		].
]
