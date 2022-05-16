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
					with: [ html
						modalDialog with: [ html
							modalContent: [ html
								modalHeader: [ html modalTitle
										level5;
										with: 'Found Animal?'.
									html modalCloseButton 
								].
								html modalBody: 'Describe Animal here pls'.
								html modalFooter: [ 
									html formButton
										beSecondary;
										dataDismiss: 'modal';
										with: 'Close'.
									html formButton
										bePrimary;
										with: 'Send application' 
								] 
							] 
						] 
					] 
	].

]
