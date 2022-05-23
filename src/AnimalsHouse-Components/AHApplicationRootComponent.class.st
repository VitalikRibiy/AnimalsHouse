Class {
	#name : #AHApplicationRootComponent,
	#superclass : #SBSComponent,
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
	app preferenceAt: #sessionClass put: AHSession.
	app addLibrary: JQDeploymentLibrary; 
	addLibrary: JQUiDeploymentLibrary; 
	addLibrary: TBSDeploymentLibrary; 
	addLibrary: SBSDevelopmentLibrary; 
	addLibrary: SBSDeploymentLibrary;
	addLibrary: SBSFileLibrary.
]

{ #category : #initialization }
AHApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
AHApplicationRootComponent >> initialize [
	super initialize.
	main := AHMainScreenComponent new.
]

{ #category : #accessing }
AHApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
AHApplicationRootComponent >> renderContentOn: html [
	html div
		style: 'background-color: #EAF6FF; height: 100%; width: 100%; min-height: 1020px';
		with: main.
]

{ #category : #rendering }
AHApplicationRootComponent >> updateRoot: anHtmlRoot [
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'AnimalsHouse'.
]
