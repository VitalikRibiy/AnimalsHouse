Class {
	#name : #AHApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #testing }
AHApplicationRootComponent class >> canBeRoot [
	^ true.
]

{ #category : #'class initialization' }
AHApplicationRootComponent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'AnimalsHouse'.
	app addLibrary: JQDeploymentLibrary; addLibrary: JQUiDeploymentLibrary; addLibrary: TBSDeploymentLibrary.
]

{ #category : #initialization }
AHApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
AHApplicationRootComponent >> initialize [
	super initialize.
	main := AHScreenComponent new.
]

{ #category : #rendering }
AHApplicationRootComponent >> renderContentOn: html [
	html render: main.
]

{ #category : #rendering }
AHApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'AnimalsHouse'.
]
