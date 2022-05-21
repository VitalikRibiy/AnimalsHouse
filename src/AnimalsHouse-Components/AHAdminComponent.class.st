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
			html card
			style: 'margin: 10px; width: fit-content';
			with: [ 
			html tbsImage
				style: 'display: flex; max-width: 25rem; width: auto; height: auto';
				url: (AHFoundAnimal selectAll at: 1) photo.
			html cardBody: [ 
			html cardTitle level5 with: 'Title'.
			html cardSubtitle 
				level6; 
				mutedText;
				with: 'sex',',', '1'.
			html formButton bePrimary with: 'Про мене' ] ].
			].
	
]
