Class {
	#name : #AHScreenComponent,
	#superclass : #WAComponent,
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
	^ AHHeaderComponent new.
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
