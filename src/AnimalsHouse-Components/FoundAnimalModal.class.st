Class {
	#name : #FoundAnimalModal,
	#superclass : #AHBasicModal,
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

	html container with: [ 
		html formButton
			style: 'height: 4vh; font-size: 16px; border-radius: 10px';
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
										html modalCloseButton ].
								self renderFormBodyOn: html ] ] ] ]
]

{ #category : #rendering }
FoundAnimalModal >> renderFormBodyOn: html [

	html modalBody: [ 
		html form
			style:
				'color: black; font-size: medium; display: flex; flex-direction: column';
			multipart;
			with: [ 
				html formGroup: [ 
						html label
							style: 'margin-right: 5px';
							with: 'Вид'.
						html select
							list: Species list;
							callback: [ :value | animalSpecies := value ] ].
				html formGroup with: [ 
					html label: 'Photo'.
					html fileUpload callback: [ :value | photo := value ] ].
				html formGroup with: [ 
					html label: 'Place'.
					html textInput
						formControl;
						callback: [ :value | place := value ] ].
				html formGroup with: [ 
					html label: 'Description'.
					html textInput
						formControl;
						callback: [ :value | description := value ] ].
				html formGroup with: [ 
					html label: 'Name'.
					html textInput
						formControl;
						callback: [ :value | contactName := value ] ].
				html formGroup with: [ 
					html label: 'Contact Phone'.
					html telephoneInput
						formControl;
						callback: [ :value | contactPhone := value ] ].
				html modalFooter: [ 
					html tbsButton
						beDefault;
						dataDismiss: 'modal';
						callback: [ self reset ];
						with: 'Close'.
					html tbsSubmitButton
						bePrimary;
						callback: [ self save ];
						with: 'Send application' ] ] ]
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

	AHFoundAnimal
		withSpecies: animalSpecies
		contactName: contactName
		contactPhone: contactPhone
		animalPhoto: (self saveImage: photo)
		animalDescription: description
		animalPlace: place.
]

{ #category : #accessing }
FoundAnimalModal >> saveImage: image [

	| filepath |
	filepath := FileSystem disk workingDirectory / image fileName.
	filepath binaryWriteStream
		nextPutAll: image rawContents;
		close.
	^ filepath pathString
]
