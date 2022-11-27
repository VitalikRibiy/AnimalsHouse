Class {
	#name : #AHAnimalCard,
	#superclass : #AHBasicCard,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHAnimalCard >> renderAnimalDataOn: html [

	html container
		style: 'margin-left: 10%; width:50%';
		with: [ 
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Кличка:'.
					html paragraph: data name ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Порода:'.
					html paragraph: data breed name ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Стать:'.
					html paragraph: data sex ].
			html row
				style: 'justify-content: start; ';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Вік:'.
					html paragraph: data age ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Вага:'.
					html paragraph: data weight ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Здоров`я:'.
					html paragraph: data healthStatus ].
			html row
				style: 'justify-content: start;';
				with: [ 
					html label
						style: 'font-size: bold; margin-right: 3%;';
						with: 'Опис:'.
					html paragraph: data description ] ]
]

{ #category : #rendering }
AHAnimalCard >> renderContentOn: html [

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
						dataTarget: '#TakeAnimalModal' , data id;
						with: 'Забрати додому' ].
			self renderModalOn: html ]
]

{ #category : #rendering }
AHAnimalCard >> renderModalBodyOn: arg1 [

	| tmp1 tmp2 tmp3 |
	tmp2 := arg1 modalBody.
	tmp2
		style: 'color: #000000; font-size: 16px';
		with: [ 
			| tmp4 |
			tmp4 := arg1 tbsImage.
			tmp4
				style:
					'border: 3px solid black; max-width: 50%; margin-left: 25%; margin-right: 25%; margin-bottom: 3%;';
				url: data image.
			self renderAnimalDataOn: arg1 ].
	tmp3 := arg1 modalFooter.
	tmp3
		style: 'justify-content: space-evenly;';
		with: [ 
			| tmp5 tmp6 |
			tmp5 := arg1 formButton.
			tmp5
				beSecondary;
				dataDismiss: 'modal';
				with: 'Закрити'.
			tmp6 := arg1 formButton.
			tmp6
				bePrimary;
				callback: [ self save ];
				with: 'Забрати' ]
]

{ #category : #rendering }
AHAnimalCard >> renderModalOn: html [

	html modal
		id: 'TakeAnimalModal' , data id;
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

{ #category : #actions }
AHAnimalCard >> save [

	AHWantAnimal
		withAnimal: data
		user: self session currentUser.
]
