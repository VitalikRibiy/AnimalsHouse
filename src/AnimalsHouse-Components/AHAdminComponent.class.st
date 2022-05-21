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
		html horizontalRule ]
]
