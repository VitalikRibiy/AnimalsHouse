Class {
	#name : #AHAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'animal',
		'contactName',
		'contactPhone'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAnimalCard >> age [
	^ animal age.
]

{ #category : #accessing }
AHAnimalCard >> animal: anObject [
	animal := anObject
]

{ #category : #accessing }
AHAnimalCard >> image [
	animal image ifNotNil: [ ^ animal image ] ifNil: [ ^ SBSCardExample imagePlaceHolderSVG ]
]

{ #category : #initialization }
AHAnimalCard >> initialize [
	super initialize.
]

{ #category : #accessing }
AHAnimalCard >> name [
	^ animal name.
]

{ #category : #rendering }
AHAnimalCard >> renderContentOn: html [
		html card
			style: 'margin: 15px';
			with: [ 
			html tbsImage
				style: 'display: flex; max-width: 100%; width: auto; height: auto';
				url: self image.
			html cardBody: [ 
			html cardTitle level5 with: self name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: self sex,',', self age printString.
			html formButton 
			bePrimary 
			dataToggle: 'modal';
			dataTarget: '#TakeAnimalModal';
			with: 'Забрати додому' ] ].
		html modal
			id: 'TakeAnimalModal';
			with: [ 
				html modalDialog with: [ 
					html modalContent: [ 
						html modalHeader: [ 
							html modalTitle
								level5;
								with: 'Забрати тварину'.
							html modalCloseButton 
						].
						self renderFormBodyOn: html.
					]
				]
			]

]

{ #category : #rendering }
AHAnimalCard >> renderFormBodyOn: html [
	html modalBody: [
		html form multipart; 
			with: [ 
			html formGroup: [ 
				html label style:'margin-right: 5px'; with: 'Ім`я'.
				html textInput callback: [ :value | contactName := value ].
			].
			html formGroup: [ 
				html label style:'margin-right: 5px'; with: 'Контактний телефон'.
				html telephoneInput callback: [ :value | contactPhone := value ].
			].
			html modalFooter: [ 
				html formButton
					beSecondary;
					dataDismiss: 'modal';
					callback: [ self reset. ];
					with: 'Закрити'.
				html formButton
					bePrimary;
					callback: [ self save. ];
					with: 'Забрати' 
			].
		].
	].
]

{ #category : #initialization }
AHAnimalCard >> reset [
	contactName := ''.
	contactPhone := ''.
]

{ #category : #actions }
AHAnimalCard >> save [
	animal remove.
]

{ #category : #accessing }
AHAnimalCard >> sex [
	^ animal sex.
]
