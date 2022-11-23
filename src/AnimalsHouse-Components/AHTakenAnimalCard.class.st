Class {
	#name : #AHTakenAnimalCard,
	#superclass : #AHAnimalCard,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHTakenAnimalCard >> renderContentOn: html [

	html card
		style: 'margin: 15px; border: 2px solid #355070;';
		with: [ 
			self renderAnimalImageOn: html with: data image.
			html cardBody: [ 
					html cardTitle level5 with: data name.
					html cardSubtitle
						level6;
						mutedText;
						with: data sex , ',' , data age printString.
					html formButton bePrimary
						dataToggle: 'modal';
						dataTarget: '#TakenAnimalModal' , data id;
						with: 'Переглянути' ].
			self renderModalOn: html ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderModalBodyOn: html [

	html modalBody
		style: 'color: #000000; font-size: 16px';
		with: [ 
			html tbsImage
				style:
					'border: 3px solid black; max-width: 50%; margin-left: 25%; margin-right: 25%; margin-bottom: 3%;';
				url: (self readImageFrom: data image).
			self renderAnimalDataOn: html ].
	html modalFooter
		style: 'justify-content: space-evenly;';
		with: [ 
			html form: [ 
					html formButton
						beSecondary;
						dataDismiss: 'modal';
						with: 'Закрити'.
		 ] ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderModalOn: html [

	html modal
		id: 'TakenAnimalModal' , data id;
		with: [ 
			html modalDialog with: [ 
					html modalContent: [ 
							self session isLogged
								ifTrue: [ 
									html modalHeader: [ 
											html modalTitle
												level5;
												with: 'Забрати тварину'.
											html modalCloseButton ].
									self renderModalBodyOn: html ]
								ifFalse: [ 
									html modalHeader: [ 
										html modalTitle
											level5;
											with: 'Доступно лише зареєстрованим користувачам'.
										html modalCloseButton ] ] ] ] ]
]
