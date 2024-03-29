Class {
	#name : #FoundAnimalModal,
	#superclass : #SBSComponent,
	#instVars : [
		'contactName',
		'contactPhone',
		'photo',
		'animalSpecies',
		'description',
		'place'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
FoundAnimalModal >> renderContentOn: html [
	html container
		with: [
			html formButton
				style: 'width: 14rem; height: 6rem';
				bePrimary;
				dataToggle: 'modal';
				dataTarget: '#FoundAnimalModal';
				with: 'Повідомити про тварину'.			
			html modal
				id: 'FoundAnimalModal';
				with: [ 
					html modalDialog with: [ 
						html modalContent: [ 
							html modalHeader: [ 
								html modalTitle
									level5;
									with: 'Повідомити про тварину'.
								html modalCloseButton 
							].
							self renderFormBodyOn: html.
						]
					]
				]
		].

]

{ #category : #rendering }
FoundAnimalModal >> renderFormBodyOn: html [
	self reset.
	html modalBody: [
		html form multipart; 
			with: [ 
			html formGroup: [ 
				html label: 'Фото'.
				html fileUpload callback: [ :file | photo := file ].
			].
			html formGroup: [ 
				html label: 'Вид'.
				html select list: Species list;
					 callback: [ :value | animalSpecies := value ].
			].
			html formGroup: [ 
				html label: 'Місце'.
				html textInput callback: [ :value | place := value ].
			].
			html formGroup: [ 
				html label: 'Опис'.
				html textInput callback: [ :value | description := value ].
			].
			html formGroup: [ 
				html label: 'Ваше Ім`я'.
				html textInput callback: [ :value | contactName := value ].
			].
			html formGroup: [ 
				html label: 'Контактний номер телефону'.
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
					with: 'Надіслати заявку' 
			].
		].
	].
]

{ #category : #initialization }
FoundAnimalModal >> reset [
	photo := nil.
	contactName := nil.
	contactPhone := nil.
	animalSpecies := 'Cat'.
	description := nil.
	place := nil.
]

{ #category : #actions }
FoundAnimalModal >> save [
	AHFoundAnimal withSpecies: animalSpecies contactName: contactName contactPhone: contactPhone animalPhoto: ('data:',(photo contentType greaseString),';base64,',(ZnBase64Encoder new encode: photo rawContents)) animalDescription: description animalPlace: place.
]
