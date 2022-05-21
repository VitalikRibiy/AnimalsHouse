Class {
	#name : #AHAdminComponent,
	#superclass : #AHScreenComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
AHAdminComponent >> createHeaderComponent [
	^ AHAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
AHAdminComponent >> foundAnimalReports [
	^ AHFoundAnimal selectAll.
]

{ #category : #'as yet unclassified' }
AHAdminComponent >> goToMainView [
	self answer
]

{ #category : #rendering }
AHAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html container: [
		html heading: 'Admin'.
		html horizontalRule ].
	html column
		extraLargeSize: 3; extraLargeOffset: 3;
		with: [
			html row with: [ 
				self foundAnimalReports collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; 
					with: (self renderReportCardOn:html with: a) 
				]
			]
		].
	
]

{ #category : #rendering }
AHAdminComponent >> renderReportCardOn: html with: aReport [
	html card
		style: 'margin: 15px';
		with: [ 
		html tbsImage
			style: 'display: flex; max-width: 100%; width: auto; height: auto';
			url: aReport photo.
		html cardBody: [ 
		html cardTitle level5 with: aReport contactName, ',', aReport contactPhone.
		html cardSubtitle 
			level6; 
			mutedText;
			with: aReport place,',', aReport description.
		html formButton bePrimary with: 'Про мене' ] ]
]
