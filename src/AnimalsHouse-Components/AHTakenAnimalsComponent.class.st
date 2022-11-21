Class {
	#name : #AHTakenAnimalsComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'takenAnimalsGrid'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHTakenAnimalsComponent >> goToMainView [ 

	self answer.
]

{ #category : #initialization }
AHTakenAnimalsComponent >> initialize [

	super initialize.
	takenAnimalsGrid := AHTakenAnimalsGrid from: self.
]
