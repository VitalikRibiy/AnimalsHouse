Class {
	#name : #AHFoundAnimalGrid,
	#superclass : #AHGeneralGrid,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHFoundAnimalGrid >> getData [
	^ AHFoundAnimal selectAll collect: [ :report | AHFoundAnimalCard withReport: report ].
]
