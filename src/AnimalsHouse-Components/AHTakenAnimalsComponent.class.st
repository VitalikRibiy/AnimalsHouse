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
AHTakenAnimalsComponent >> goToReviewsView [

	self call: AHReviewsComponent new
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
				style: 'justify-content: center;';
				with: [ 
					html label
						style: 'font-size: 24px';
						with: 'Тварин прилаштовано'.
					html progress
						style: 'height: 40px; width: 100%';
						with: [ 
							html progressBar
								infoBackground;
								valueNow: Animal takenPercent;
								with: Animal takenPercent asString , '%' ] ].
			html row
				style: 'min-height: inherit;';
				with: takenAnimalsGrid ]
]
