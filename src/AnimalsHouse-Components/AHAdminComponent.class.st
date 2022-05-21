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
	^ AHFoundAnimal selectAll collect: [ :report | AHFoundAnimalCard withReport: report ].
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
				self foundAnimalReports collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; with: a.
				]
			]
		].
	
]
