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
			self renderAnimalImageOn: html with: data animal image.
			html cardBody: [ 
					html cardTitle level5 with:
							data user userInfo firstName , ','
							, data user userInfo phoneNumber.
					html cardSubtitle
						level6;
						mutedText;
						with:
							data animal name printString , ','
							, data animal age printString , ','
							, data animal breed name printString.
					html formButton bePrimary
						dataToggle: 'modal';
						dataTarget: '#GiveAnimalModal' , data id;
						with: 'Віддати' ] ].
	html modal
		id: 'GiveAnimalModal', data id;
		with: [ 
			html modalDialog
				style: 'max-width: 70vh';
				with: [ 
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
							style:
						'color: black; font-size: medium; display: flex; flex-direction: column';
			multipart;
			with: [ 
				html modalFooter: [ 
						html label
							style: 'justify-content: start;';
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
AHWantAnimalCard >> renderReview: review on: html [

	html row with: [ 
		html tbsPanel
			style: 'width: 100%';
			class: 'panel-danger' if: review type = ReviewType negative;
			class: 'panel-success' if: review type = ReviewType positive;
			with: [ 
				html tbsPanelHeading: [ 
						html tbsPanelTitle
							level: 3;
							with: review sender userInfo firstName , ' '
								, review sender userInfo lastName , '-'
								, review date asDate asString ].
				html horizontalRule.
				html tbsPanelBody: review text ] ]
]

{ #category : #rendering }
AHWantAnimalCard >> renderReviewsOn: html [

	| reviews |
	reviews := data user getReviews.
	^ (reviews collect: [ :filteredReview | 
		   self renderReview: filteredReview on: html ]) sort: [ :a :b | 
		  a date > b date ]
]

{ #category : #rendering }
AHWantAnimalCard >> renderUserInfoOn: html [

	html container
		style:
			'margin-left: 5%; width:80%;color: black; font-size: medium; display: flex; flex-direction: column';
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
					html paragraph: data user userInfo phoneNumber ].
			data user hasReviews ifTrue: [
			html div
				style:
					'justify-content: start; overflow-x: hidden; overflow-y: auto; border: 3px solid #355070; border-radius: 12px; padding: 5px; max-height: 50vh';
				with: [ self renderReviewsOn: html ] ] ]
]
