Class {
	#name : #AHWantAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'request'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHWantAnimalCard class >> withRequest: requestValue [
	^ (self new) request: requestValue; yourself.
]

{ #category : #rendering }
AHWantAnimalCard >> renderContentOn: html [
	html card
		style: 'margin: 15px';
		with: [ 
		html tbsImage
			style: 'display: flex; max-width: 100%; width: auto; height: auto';
			url: request animal photo.
		html cardBody: [ 
		html cardTitle level5 with: request contactName, ',', request contactPhone.
		html cardSubtitle 
			level6; 
			mutedText;
			with: request animal name,',', request animal age, ',', request animal breed name.
		html formButton 
			bePrimary 
			dataToggle: 'modal';
			dataTarget: '#GiveAnimalModal';
			with: 'Віддати' ] ].
		html modal
			id: 'GiveAnimalModal';
			with: [ 
				html modalDialog with: [ 
					html modalContent: [ 
						html modalHeader: [ 
							html modalTitle
								level5;
								with: 'Віддати тварину'.
							html modalCloseButton 
						].
						self renderFormBodyOn: html.
					]
				]
			]
]

{ #category : #rendering }
AHWantAnimalCard >> renderFormBodyOn: html [
	html modalBody: [
			html render: 'Віддати тварину новому власнику?'.
			html modalFooter: [ 
				html formButton
					beSecondary;
					dataDismiss: 'modal';
					callback: [ self reset. ];
					with: 'Ні'.
				html formButton
					bePrimary;
					callback: [ self save. ];
					with: 'Так' 
			].
		].
]

{ #category : #accessing }
AHWantAnimalCard >> request: requestValue [
	request := requestValue.
]

{ #category : #initialization }
AHWantAnimalCard >> reset [
	request remove.
]

{ #category : #actions }
AHWantAnimalCard >> save [
	request animal remove.
	request remove.
]
