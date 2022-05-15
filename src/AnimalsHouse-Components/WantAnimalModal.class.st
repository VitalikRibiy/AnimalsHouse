Class {
	#name : #WantAnimalModal,
	#superclass : #SBSComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
WantAnimalModal >> initialize [
	super initialize.
]

{ #category : #rendering }
WantAnimalModal >> renderContentOn: html [
	html formButton
		bePrimary;
		dataToggle: 'modal';
		dataTarget: '#WantAnimalModal';
		with: 'Want Animal?'.			
	html tbsModal
		id: 'WantAnimalModal';
		with: [ html
				tbsModalDialog with: [ html
						tbsModalContent: [ html
								tbsModalHeader: [ html modalTitle
										level5;
										with: 'Want Animal?'.
									html modalCloseButton ].
							html tbsModalBody: 'Tell us about you and animal you want pls'.
							html
								tbsModalFooter: [ html formButton
										beSecondary;
										dataDismiss: 'modal';
										with: 'Close'.
									html formButton
										bePrimary;
										with: 'Send application' ] ] ] ]

]
