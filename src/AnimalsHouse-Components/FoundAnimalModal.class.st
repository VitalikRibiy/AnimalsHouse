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

{ #category : #accessing }
FoundAnimalModal >> contactName [

	^ contactName
]

{ #category : #accessing }
FoundAnimalModal >> contactPhone [

	^ contactPhone
]

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
			multipart;
			with: [ 
				html formGroup
					style: 'color: black; font-size: medium; display: flex; flex-direction: column';
					with: [ 
						html label: 'Photo'.
						html fileUpload callback: [ :value | photo := value ].
						html label: 'Place'.
						html textInput callback: [ :value | place := value ].
						html label: 'Description'.
						html textInput callback: [ :value | description := value ].
						html label: 'Name'.
						html textInput callback: [ :value | contactName := value ].
						html label: 'Contact Phone'.
						html telephoneInput callback: [ :value | contactPhone := value ] ] ].
		html modalFooter: [ 
			| tmp3 tmp4 |
			tmp3 := html formButton.
			tmp3
				beSecondary;
				dataDismiss: 'modal';
				callback: [ self reset ];
				with: 'Close'.
			tmp4 := html formButton.
			tmp4
				bePrimary;
				callback: [ self save ];
				with: 'Send application' ] ]
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
		animalPlace: place
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
