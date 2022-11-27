Class {
	#name : #AHMainScreenComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'carousel',
		'grid',
		'takenAnimalsView'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToAdminView [
	self call: adminView.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToMainView [

	self application url
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToReviewsView [

	self call: AHReviewsComponent new
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToTakenAnimalsView [
	
	self call: takenAnimalsView.
]

{ #category : #initialization }
AHMainScreenComponent >> initialize [

	super initialize.
	carousel := AHCarouselPhotos new.
	grid := AHAnimalsGrid from: self.
	takenAnimalsView := AHTakenAnimalsComponent new.
]

{ #category : #rendering }
AHMainScreenComponent >> renderContentOn: html [

	super renderContentOn: html.
]

{ #category : #rendering }
AHMainScreenComponent >> renderMainContentOn: html [

	html column
		style:
			'display: inline-flex; flex-direction: column; vertical-align: top;';
		extraLargeSize: 12;
		with: [ 
			self renderLoginErrorMessageIfAnyOn: html.
			html row
				style: 'justify-content: center; max-height: 300px';
				with: carousel.
			html row
				style:
					'display:flex; flex-direction: column; align-items: center;';
				justifyContentCenterVeryLarge;
				with: [ 
					html heading
						style: 'padding-top: 10px; marigin-bottom: 0px;';
						level2;
						with: 'Знайшли тварину? Допоможіть нам знайти їй домівку:'.
					html column
						style: 'text-align: center';
						extraLargeSize: 2;
						with: (FoundAnimalModal from: self).
					html heading
						level2;
						with: 'Станьте власником чотирилапого чуда!' ].
			html row
				with: [ 
					html column
						extraLargeSize: 10;
						extraLargeOffset: 1;
						mediumSize: 10;
						mediumOffset: 1;
						with: grid ] ]
]
