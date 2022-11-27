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
FoundAnimalModal >> renderFormBodyOn: arg1 [

	| tmp1 |
	arg1 modalBody: [ 
		| tmp2 |
		tmp2 := arg1 form.
		tmp2
			multipart;
			with: [ 
				arg1
					formGroup: [ 
						arg1 label: 'Photo'.
						arg1 fileUpload callback: [ :arg2 | photo := arg2 ] ];
					formGroup: [ 
						arg1 label: 'Place'.
						arg1 textInput callback: [ :arg3 | place := arg3 ] ];
					formGroup: [ 
						arg1 label: 'Description'.
						arg1 textInput callback: [ :arg4 | description := arg4 ] ];
					formGroup: [ 
						arg1 label: 'Name'.
						arg1 textInput callback: [ :arg5 | contactName := arg5 ] ];
					formGroup: [ 
						arg1 label: 'Contact Phone'.
						arg1 telephoneInput callback: [ :arg6 | contactPhone := arg6 ] ];
					modalFooter: [ 
						| tmp3 tmp4 |
						tmp3 := arg1 formButton.
						tmp3
							beSecondary;
							dataDismiss: 'modal';
							callback: [ self reset ];
							with: 'Close'.
						tmp4 := arg1 formButton.
						tmp4
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
