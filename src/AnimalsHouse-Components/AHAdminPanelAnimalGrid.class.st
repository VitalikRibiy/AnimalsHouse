Class {
	#name : #AHAdminPanelAnimalGrid,
	#superclass : #SBSComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #'private - protocol' }
AHAdminPanelAnimalGrid >> getData [
	self subclassResponsibility.
]

{ #category : #rendering }
AHAdminPanelAnimalGrid >> renderContentOn: html [
	html column
		style: 'background: #6F9DC8';
		extraLargeSize: 12;
		mediumSize: 12;
		smallSize: 12;
		with: [
			html row with: [ 
				self getData collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; with: a. ]
			]
		].
]
