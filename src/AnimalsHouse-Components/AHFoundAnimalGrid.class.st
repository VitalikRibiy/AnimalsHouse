Class {
	#name : #AHFoundAnimalGrid,
	#superclass : #AHAdminPanelAnimalGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHFoundAnimalGrid >> getData [
	^ AHFoundAnimal selectAll collect: [ :report | AHFoundAnimalCard withReport: report ].
]
