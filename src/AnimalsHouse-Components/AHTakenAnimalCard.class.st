Class {
	#name : #AHTakenAnimalCard,
	#superclass : #AHAnimalCard,
	#instVars : [
		'image',
		'comment',
		'showUpload'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #initialization }
AHTakenAnimalCard >> initialize [

	super initialize.
	showUpload := true
]

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
			self renderModalOn: html.
			self renderReportModalOn: html ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderModalBodyOn: html [

	html modalBody
		style:
			'color: #000000; font-size: 16px; overflow-x: hidden; overflow-y: auto;';
		with: [ 
			html tbsImage
				style:
					'border: 3px solid black; max-width: 50%; margin-left: 25%; margin-right: 25%; margin-bottom: 3%;';
				url: (self readImageFrom: data image).
			self renderAnimalDataOn: html.
			html div
			style: 'overflow-x: hidden; overflow-y: auto; max-height: 600px';
			 with: [ self renderReportsDataOn: html ] ].
	html modalFooter
		style: 'justify-content: space-evenly;';
		with: [ 
			html form: [ 
					html formButton
						beSecondary;
						dataDismiss: 'modal';
						with: 'Закрити'.

					self session currentUser voyageId = data owner voyageId ifTrue: [ 
						html formButton
							bePrimary;
							dataToggle: 'modal';
							dataTarget: '#ReportModal';
							dataDismiss: 'modal';
							with: 'Додати звіт' ] ] ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderModalOn: html [

	html modal
		id: 'TakenAnimalModal' , data id;
		with: [ 
			html modalDialog with: [ 
					html modalContent: [ 
							html modalHeader: [ 
									html modalTitle
										level5;
										with: 'Забрана тварина'.
									html modalCloseButton ].
							self renderModalBodyOn: html ] ] ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderReportModalBodyOn: html [

	self reset.
	html modalBody: [ 
		html form
			multipart;
			with: [ 
				html formGroup: [ 
						html label: 'Фото'.
						html fileUpload callback: [ :file | image := file ] ].
				html formGroup: [ 
						html label: 'Коментар'.
						html textInput callback: [ :value | comment := value ] ].
				html modalFooter: [ 
						html formButton
							beSecondary;
							dataDismiss: 'modal';
							callback: [ self reset ];
							with: 'Закрити'.
						html formButton
							bePrimary;
							callback: [ self save ];
							with: 'Зберегти' ] ] ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderReportModalOn: html [

	html modal
		id: 'ReportModal';
		with: [ 
			html modalDialog with: [ 
					html modalContent: [ 
							html modalHeader: [ 
									html modalTitle
										level5;
										with: 'Завантажити звіт'.
									html modalCloseButton ].
							self renderReportModalBodyOn: html ] ] ]
]

{ #category : #rendering }
AHTakenAnimalCard >> renderReportsDataOn: html [

	data reports size = 0 ifTrue: [ ^ false ].
	html heading
		style: 'margin: 5%';
		level: 4;
		with: 'Моя подальша доля:'.

	data reports collect: [ :report | 
		html horizontalRule.
		html row
			style: 'display: inline-flex; justify-content: center';
			with: [ 
				html tbsImage
					style:
						'border: 3px solid black; max-width: 50%; margin-left: 25%; margin-right: 25%; margin-bottom: 3%;';
					url: (self readImageFrom: report image).
				html paragraph
					style: 'margin: 3%; word-break: break-word';
					with: report comment ] ]
]

{ #category : #initialization }
AHTakenAnimalCard >> reset [

	image := nil.
	comment := nil.
]

{ #category : #initialization }
AHTakenAnimalCard >> resetUpload [

	showUpload := false.
]

{ #category : #actions }
AHTakenAnimalCard >> save [

	| report |
	report := AHReport
		          withAnimal: data
		          user: data owner
		          image: (self saveImage: image)
		          comment: comment
		          date: DateAndTime now asUTC.
	data addReport: report;
		save
]

{ #category : #accessing }
AHTakenAnimalCard >> showUpload [

	showUpload := true.
]
