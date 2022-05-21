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
	html modalBody: [
		html form: [ 
			html formGroup: [ 
				html label: 'Photo'.
				html fileUpload callback: [ :file | photo := file ].
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
