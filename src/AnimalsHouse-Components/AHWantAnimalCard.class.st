Class {
	#name : #AHWantAnimalCard,
	#superclass : #AHBasicCard,
	#category : #'AnimalsHouse-Components'
}

{ #category : #actions }
AHWantAnimalCard >> approve [

	data animal
		status: AnimalStatus taken;
		owner: data user;
		save.
	data remove
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
					data user userInfo firstName , ','
					, data user userInfo phoneNumber.
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
							self renderModalBodyOn: html ] ] ]
]

{ #category : #rendering }
AHWantAnimalCard >> renderModalBodyOn: html [

	html modalBody: [ 
		self renderUserInfoOn: html.
		html form
			multipart;
			with: [ 
				html modalFooter: [ 
						html label style: 'justify-content: start;';
						with: 'Віддати тварину новому власнику?'.
						html formButton
							beSecondary;
							callback: [ self delete ];
							with: 'Ні'.
						html formButton
							bePrimary;
							callback: [ self approve ];
							with: 'Так' ] ] ]
]

{ #category : #rendering }
AHWantAnimalCard >> renderUserInfoOn: html [

	html container
		style: 'margin-left: 10%; width:50%';
		with: [ 
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Ім`я:'.
					html paragraph: data user userInfo firstName ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Прізвище:'.
					html paragraph: data user userInfo lastName ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Електронна адреса:'.
					html paragraph: data user userInfo email ].
			html row
				style: 'justify-content: start; ';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Номер телефону:'.
					html paragraph: data user userInfo phoneNumber ] ]
]
