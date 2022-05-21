Class {
	#name : #AHFoundAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'report'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHFoundAnimalCard class >> withReport: aReport [
	| instance |
	instance := self new.
	instance report: aReport.
	^ instance.
]

{ #category : #rendering }
AHFoundAnimalCard >> renderContentOn: html [
	html card
		style: 'margin: 15px';
		with: [ 
		html tbsImage
			style: 'display: flex; max-width: 100%; width: auto; height: auto';
			url: report photo.
		html cardBody: [ 
		html cardTitle level5 with: report contactName, ',', report contactPhone.
		html cardSubtitle 
			level6; 
			mutedText;
			with: report place,',', report description.
		html formButton bePrimary with: 'Про мене' ] ]
]

{ #category : #accessing }
AHFoundAnimalCard >> report [

	^ report
]

{ #category : #accessing }
AHFoundAnimalCard >> report: anObject [

	report := anObject
]
