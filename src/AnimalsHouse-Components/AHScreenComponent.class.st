Class {
	#name : #AHScreenComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'header'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #hooks }
AHScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
AHScreenComponent >> createHeaderComponent [
	^ AHHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> goToMainView [
	
	self subclassResponsibility.
]

{ #category : #initialization }
AHScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent.
]

{ #category : #rendering }
AHScreenComponent >> renderContentOn: html [
	html render: header.
]

{ #category : #rendering }
AHScreenComponent >> renderFooterOn: html [

	html container:[ 
		html label: 'footer'.
		]
]
