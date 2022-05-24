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
	| instance |
	instance := self new.
	instance request: requestValue.
	^ instance.
]

{ #category : #actions }
AHWantAnimalCard >> approve [
	request animal remove.
	request remove.
]

{ #category : #'submorphs - add/remove' }
AHWantAnimalCard >> delete [
	request remove.
]

{ #category : #rendering }
AHWantAnimalCard >> renderContentOn: html [
	html card
		style: 'margin: 15px';
		with: [ 
		html tbsImage
			style: 'display: flex; max-width: 100%; width: auto; height: auto';
			url: request animal image.
		html cardBody: [ 
		html cardTitle level5 with: request contactName, ',', request contactPhone.
		html cardSubtitle 
			level6; 
			mutedText;
			with: request animal name printString,',', request animal age printString, ',', request animal breed name printString.
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
		html form multipart; with: [
			html formGroup: [ 
				 html render: 'Віддати тварину новому власнику?'.
			].
			html modalFooter: [ 
				html formButton
					beSecondary;
					callback: [ self delete. ];
					with: 'Ні'.
				html formButton
					bePrimary;
					callback: [ self approve. ];
					with: 'Так' 
			].
		].
	].
]

{ #category : #accessing }
AHWantAnimalCard >> request: requestValue [
	request := requestValue.
]
