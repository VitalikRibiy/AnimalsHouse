Class {
	#name : #AHHeaderComponent,
	#superclass : #AnObsoleteWAComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ 
		html tbsNavbarBrand
			url: self application url;
			with: 'AnimalsHouse'.
		html tbsNavbarButton: 'SignIn'].
]

{ #category : #rendering }
AHHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [ 
		html tbsContainer: [ 
			self renderBrandOn: html
	] ]
]
