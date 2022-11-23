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
AHScreenComponent >> renderAdOn: html [

	html container
		style:
			'height: 100%; background-color: #6F9DC8;';
		with: [ html label with: 'Реклама' ]
]

{ #category : #rendering }
AHScreenComponent >> renderContentOn: html [

	html column
		style: 'display: flex; flex-direction: column; min-height: 100vh';
		with: [ 
			html row
				style: 'min-height: 8vh';
				with: [ html render: header ].
			html row
				style: 'min-height: 86vh';
				with: [ 
					html column
						style: 'justify-content: center;';
						extraLargeSize: 1;
						with: [ self renderAdOn: html ].
					html column
						extraLargeSize: 10;
						with: [ self renderMainContentOn: html ].
					html column
											style: 'justify-content: center;';
						extraLargeSize: 1;
						with: [ self renderAdOn: html ] ].
			html row
				style: 'min-height: 6vh';
				with: [ self renderFooterOn: html ] ]
]

{ #category : #rendering }
AHScreenComponent >> renderFooterOn: html [

	html row
		style:
			'width: 100%;background-color: #355070; margin-top: 1%; min-height: 25px;';
		with: [ html label: 'footer' ]
]

{ #category : #rendering }
AHScreenComponent >> renderMainContentOn: html [
	
	^ self subclassResponsibility.
]
