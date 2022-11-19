Class {
	#name : #AHAnimalCard,
	#superclass : #AHBasicCard,
	#instVars : [
		'contactName',
		'contactPhone'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHAnimalCard >> renderContentOn: html [
		html card
			style: 'margin: 15px';
			with: [ 
			html tbsImage
				style: 'display: flex; max-width: 100%; width: auto; height: auto';
				url: data image.
			html cardBody: [ 
			html cardTitle level5 with: data name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: data sex,',', data age printString.
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
	AHWantAnimal withAnimal: data contactName: contactName contactPhone: contactPhone.
	self reset.
]
