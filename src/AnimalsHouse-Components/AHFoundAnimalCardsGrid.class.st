Class {
	#name : #AHFoundAnimalCardsGrid,
	#superclass : #SBSComponent,
	#instVars : [
		'reports'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHFoundAnimalCardsGrid >> foundAnimalReports [
	reports := AHFoundAnimal selectAll collect: [ :report | AHFoundAnimalCard withReport: report ].
	^ reports.
]

{ #category : #initialization }
AHFoundAnimalCardsGrid >> initialize [
	super initialize.
	reports := OrderedCollection.
]

{ #category : #rendering }
AHFoundAnimalCardsGrid >> renderContentOn: html [
	html column
		style: 'background: #6F9DC8';
		extraLargeSize: 12;
		mediumSize: 12;
		smallSize: 12;
		with: [
			html row with: [ 
				self foundAnimalReports collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; with: a. ]
			]
		].
]
