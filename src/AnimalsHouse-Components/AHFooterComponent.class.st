Class {
	#name : #AHFooterComponent,
	#superclass : #WAComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHFooterComponent >> renderContentOn: html [
	html div whiteText 
		with: [ html div darkBackground with: 'Footer here!' ].
]
