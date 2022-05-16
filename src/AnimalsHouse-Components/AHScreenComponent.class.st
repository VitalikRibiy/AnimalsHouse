Class {
	#name : #AHScreenComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'header',
		'footer'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #hooks }
AHScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
AHScreenComponent >> createFooterComponent [
	^ AHFooterComponent new.
]

{ #category : #initialization }
AHScreenComponent >> createHeaderComponent [
	^ AHHeaderComponent new.
]

{ #category : #initialization }
AHScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent.
	footer := self createFooterComponent.
]

{ #category : #rendering }
AHScreenComponent >> renderContentOn: html [
	html render: header.
]
