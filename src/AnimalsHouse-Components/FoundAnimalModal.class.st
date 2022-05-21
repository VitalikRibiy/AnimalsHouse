Class {
	#name : #FoundAnimalModal,
	#superclass : #SBSComponent,
	#instVars : [
		'contactName',
		'contactPhone',
		'photo',
		'description',
		'place'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
FoundAnimalModal >> initialize [
	super initialize.
]

{ #category : #rendering }
FoundAnimalModal >> renderContentOn: html [
	html container
		with: [
			html formButton
				style: 'width: 12rem; height: 6rem';
				bePrimary;
				dataToggle: 'modal';
				dataTarget: '#FoundAnimalModal';
				with: 'Found Animal?'.			
			html modal
				id: 'FoundAnimalModal';
				with: [ 
					html modalDialog with: [ 
						html modalContent: [ 
							html modalHeader: [ 
								html modalTitle
									level5;
									with: 'Found Animal?'.
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
				html label: 'Photo'.
				html fileUpload callback: [ :file | photo := file ].
			].
			html formGroup: [ 
				html label: 'Place'.
				html textInput callback: [ :value | place := value ].
			].
			html formGroup: [ 
				html label: 'Description'.
				html textInput callback: [ :value | description := value ].
			].
			html formGroup: [ 
				html label: 'Name'.
				html textInput callback: [ :value | contactName := value ].
			].
			html formGroup: [ 
				html label: 'Contact Phone'.
				html telephoneInput callback: [ :value | contactPhone := value ].
			].
			html modalFooter: [ 
				html formButton
					beSecondary;
					dataDismiss: 'modal';
					callback: [ self reset. ];
					with: 'Close'.
				html formButton
					bePrimary;
					callback: [ self save. ];
					with: 'Send application' 
			].
		].
	].
]

{ #category : #initialization }
FoundAnimalModal >> reset [
	photo := nil.
]

{ #category : #actions }
FoundAnimalModal >> save [
	AHFoundAnimal withContactName: contactName contactPhone: contactPhone animalPhoto: photo animalDescription: description animalPlace: place.
]
