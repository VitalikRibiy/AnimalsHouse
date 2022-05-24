Class {
	#name : #AHGeneralGrid,
	#superclass : #SBSComponent,
	#instVars : [
		'sorting'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'private - protocol' }
AHGeneralGrid >> getData [
	self subclassResponsibility.
]

{ #category : #rendering }
AHGeneralGrid >> renderContentOn: html [
	html column
		style: 'background: #6F9DC8; paddign: 0px';
		extraLargeSize: 12;
		mediumSize: 12;
		smallSize: 12;
		with: [
			sorting isNotNil ifTrue: [ 
				html row style: 'background: #2e608f';
					with: sorting. 
				].
			html row with: [ 
				self getData collect: [ :a | html column extraLargeSize: 3; mediumSize: 4; smallSize: 6; with: a. ]
			]
		].
]
