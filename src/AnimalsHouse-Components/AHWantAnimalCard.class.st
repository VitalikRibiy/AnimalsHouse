Class {
	#name : #AHWantAnimalCard,
	#superclass : #AHBasicCard,
	#category : #'AnimalsHouse-Components'
}

{ #category : #actions }
AHWantAnimalCard >> approve [
	data animal remove.
	data remove.
]

{ #category : #'submorphs - add/remove' }
AHWantAnimalCard >> delete [
	data remove.
]

{ #category : #rendering }
AHWantAnimalCard >> renderContentOn: html [

	html card
		style: 'margin: 15px';
		with: [ 
			html tbsImage
				style: 'display: flex; max-width: 100%; width: auto; height: auto';
				url: data animal image.
			html cardBody: [ 
				html cardTitle level5 with:
					data user userInfo firstName , ',' , data user userInfo phoneNumber.
				html cardSubtitle
					level6;
					mutedText;
					with:
						data animal name printString , ',' , data animal age printString
						, ',' , data animal breed name printString.
				html formButton bePrimary
					dataToggle: 'modal';
					dataTarget: '#GiveAnimalModal';
					with: 'Віддати' ] ].
	html modal
		id: 'GiveAnimalModal';
		with: [ 
			html modalDialog with: [ 
					html modalContent: [ 
							html modalHeader: [ 
									html modalTitle
										level5;
										with: 'Віддати тварину'.
									html modalCloseButton ].
							self renderFormBodyOn: html ] ] ]
]

{ #category : #rendering }
AHWantAnimalCard >> renderFormBodyOn: html [
	html modalBody: [
		html form multipart; with: [
			html formGroup: [ 
				 html render: 'Віддати тварину новому власнику?'.
			].
			html modalFooter: [ 
				html formButton
					beSecondary;
					callback: [ self delete. ];
					with: 'Ні'.
				html formButton
					bePrimary;
					callback: [ self approve. ];
					with: 'Так' 
			].
		].
	].
]
