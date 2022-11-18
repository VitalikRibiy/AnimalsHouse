Class {
	#name : #AHAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'animal',
		'contactName',
		'contactPhone',
		'component'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHAnimalCard class >> from: aComponent [
	^ self new
	 component: aComponent;
	yourself
]

{ #category : #accessing }
AHAnimalCard >> animal: anObject [
	animal := anObject
]

{ #category : #accessing }
AHAnimalCard >> component [ 
	^ component.
]

{ #category : #accessing }
AHAnimalCard >> component: componentObject [
	component := componentObject.
]

{ #category : #rendering }
AHAnimalCard >> renderContentOn: html [
		html card
			style: 'margin: 15px';
			with: [ 
			html tbsImage
				style: 'display: flex; max-width: 100%; width: auto; height: auto';
				url: animal image.
			html cardBody: [ 
			html cardTitle level5 with: animal name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: animal sex,',', animal age printString.
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
						self session isLogged 
							ifTrue: [ 
								html modalHeader: [ 
									html modalTitle
									level5;
									with: 'Забрати тварину'.
									html modalCloseButton 
								].
								self renderFormBodyOn: html. ] 
							ifFalse: [
								html modalHeader: [ 
									html modalTitle
									level5;
									with: 'Доступно лише зареєстрованим користувачам'.
									html modalCloseButton 
								].
								]. 
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
	AHWantAnimal withAnimal: animal contactName: contactName contactPhone: contactPhone.
	self reset.
]
