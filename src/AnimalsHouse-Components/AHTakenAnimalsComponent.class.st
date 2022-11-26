Class {
	#name : #AHTakenAnimalsComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'takenAnimalsGrid'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHTakenAnimalsComponent >> goToAdminView [

	self call: AHAdminComponent new
]

{ #category : #accessing }
AHTakenAnimalsComponent >> goToMainView [

	self answer
]

{ #category : #'as yet unclassified' }
AHTakenAnimalsComponent >> goToTakenAnimalsView [

	self shouldNotImplement
]

{ #category : #initialization }
AHTakenAnimalsComponent >> initialize [

	super initialize.
	takenAnimalsGrid := AHTakenAnimalsGrid from: self.
]

{ #category : #rendering }
AHTakenAnimalsComponent >> renderContentOn: html [

	super renderContentOn: html.
]

{ #category : #rendering }
AHTakenAnimalsComponent >> renderMainContentOn: html [

	html column
		style: 'min-height: 86vh';
		extraLargeSize: 10;
		extraLargeOffset: 1;
		mediumSize: 8;
		mediumOffset: 2;
		with: [ 
			self renderLoginErrorMessageIfAnyOn: html.
			html row
				style: 'min-height: inherit;';
				with: takenAnimalsGrid ]
]
