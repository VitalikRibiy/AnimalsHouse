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

{ #category : #rendering }
AHTakenAnimalsComponent >> renderContentOn: html [

	super renderContentOn: html.
	html row: [ html label: 'Забрані тварини' ]. self renderFooterOn: html
]
