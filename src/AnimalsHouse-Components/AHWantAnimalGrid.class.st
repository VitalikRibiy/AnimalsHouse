Class {
	#name : #AHWantAnimalGrid,
	#superclass : #AHAdminPanelAnimalGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHWantAnimalGrid >> getData [
	^ AHWantAnimal selectAll collect: [ :report | AHWantAnimalCard withRequest: report ].
]
