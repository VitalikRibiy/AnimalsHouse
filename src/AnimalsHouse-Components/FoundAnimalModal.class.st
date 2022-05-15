Class {
	#name : #FoundAnimalModal,
	#superclass : #SBSComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
FoundAnimalModal >> initialize [
	super initialize.
]

{ #category : #rendering }
FoundAnimalModal >> renderContentOn: html [
	html formButton
		bePrimary;
		dataToggle: 'modal';
		dataTarget: '#FoundAnimalModal';
		with: 'Found Animal?'.			
	html tbsModal
		id: 'FoundAnimalModal';
		with: [ html
				tbsModalDialog with: [ html
						tbsModalContent: [ html
								tbsModalHeader: [ html modalTitle
										level5;
										with: 'Found Animal?'.
									html modalCloseButton ].
							html tbsModalBody: 'Describe Animal here pls'.
							html
								tbsModalFooter: [ html formButton
										beSecondary;
										dataDismiss: 'modal';
										with: 'Close'.
									html formButton
										bePrimary;
										with: 'Send application' ] ] ] ]

]
