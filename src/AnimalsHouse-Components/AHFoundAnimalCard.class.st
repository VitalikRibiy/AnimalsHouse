Class {
	#name : #AHFoundAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'report',
		'name',
		'age',
		'sex',
		'species',
		'breed',
		'weight',
		'healthStatus',
		'description',
		'image'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHFoundAnimalCard class >> withReport: aReport [
	| instance |
	instance := self new.
	instance report: aReport.
	^ instance.
]

{ #category : #accessing }
AHFoundAnimalCard >> age [

	^ age
]

{ #category : #accessing }
AHFoundAnimalCard >> age: anObject [

	age := anObject.
]

{ #category : #accessing }
AHFoundAnimalCard >> breed [

	^ breed
]

{ #category : #accessing }
AHFoundAnimalCard >> breed: breedName [
	breed := (Breed selectAll select: [ :breedObj | breedObj name = breedName ]) at: 1
]

{ #category : #accessing }
AHFoundAnimalCard >> description [

	^ description
]

{ #category : #accessing }
AHFoundAnimalCard >> description: anObject [

	description := anObject
]

{ #category : #accessing }
AHFoundAnimalCard >> healthStatus [

	^ healthStatus
]

{ #category : #accessing }
AHFoundAnimalCard >> healthStatus: anObject [

	healthStatus := anObject
]

{ #category : #accessing }
AHFoundAnimalCard >> image [

	^ image
]

{ #category : #accessing }
AHFoundAnimalCard >> image: anObject [

	image := ('data:',(anObject contentType greaseString),';base64,',(ZnBase64Encoder new encode: anObject rawContents))
]

{ #category : #accessing }
AHFoundAnimalCard >> name [

	^ name
]

{ #category : #accessing }
AHFoundAnimalCard >> name: anObject [

	name := anObject
]

{ #category : #rendering }
AHFoundAnimalCard >> renderContentOn: html [
	html card
		style: 'margin: 15px';
		with: [ 
		html tbsImage
			style: 'display: flex; max-width: 100%; width: auto; height: auto';
			url: report photo.
		html cardBody: [ 
		html cardTitle level5 with: report contactName, ',', report contactPhone.
		html cardSubtitle 
			level6; 
			mutedText;
			with: report place,',', report description.
		html formButton 
			bePrimary 
			dataToggle: 'modal';
			dataTarget: '#AddAnimalModal';
			with: 'Зареєструвати' ] ].
		html modal
			id: 'AddAnimalModal';
			with: [ 
				html modalDialog with: [ 
					html modalContent: [ 
						html modalHeader: [ 
							html modalTitle
								level5;
								with: 'Зареєструвати тварину'.
							html modalCloseButton 
						].
						self renderFormBodyOn: html.
					]
				]
			]
]

{ #category : #rendering }
AHFoundAnimalCard >> renderFormBodyOn: html [
	self reset.
	html modalBody: [
		html form multipart; 
			with: [ 
			html formGroup: [
				html label: 'Фото'.
				html fileUpload callback: [ :file | self image: file ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Кличка'.
				html textInput callback: [ :value | name := value ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Стать'.
				html select formControl list: (Sex list);
					callback: [ :value | sex := value ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Порода'.
				html select list: (Species breedsOf: report animalSpecies);
					 callback: [ :value | self breed: value ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Вік'.
				html textInput callback: [ :value | age := value asNumber ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Вага'.
				html textInput callback: [ :value | weight := value asNumber ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Здоров`я'.
				html textInput callback: [ :value | healthStatus := value ].
			].
			html formGroup: [ 
				html label style: 'margin-right: 5px'; with: 'Опис'.
				html textInput callback: [ :value | description := value ].
			].
			html modalFooter: [ 
				html formButton
					beSecondary;
					dataDismiss: 'modal';
					callback: [ self reset. ];
					with: 'Закрити'.
				html formButton
					bePrimary;
					callback: [ self save. ];
					with: 'Зареєструвати' 
			].
		].
	].
]

{ #category : #accessing }
AHFoundAnimalCard >> report [

	^ report
]

{ #category : #accessing }
AHFoundAnimalCard >> report: anObject [

	report := anObject
]

{ #category : #actions }
AHFoundAnimalCard >> reset [
	name := nil.
	age := nil.
	sex := nil.
	species := report animalSpecies.
	breed := (Species breedsOf: species) asArray at: 1.
	weight := nil.
	healthStatus := nil.
	description := nil.
	image := nil. 
]

{ #category : #actions }
AHFoundAnimalCard >> save [

	| selectedClass |
	selectedClass := report animalSpecies = Species cat
		                 ifTrue: [ Cat ]
		                 ifFalse: [ Dog ].
	image ifNil: [ image := report photo ].
	selectedClass
		withName: name
		age: age
		sex: sex
		breed: breed
		weight: weight
		healthStatus: healthStatus
		description: description
		image: image.
	report remove
]

{ #category : #accessing }
AHFoundAnimalCard >> sex [

	^ sex
]

{ #category : #accessing }
AHFoundAnimalCard >> sex: anObject [

	sex := anObject
]

{ #category : #accessing }
AHFoundAnimalCard >> species: anObject [

	species := anObject
]

{ #category : #accessing }
AHFoundAnimalCard >> weight [

	^ weight
]

{ #category : #accessing }
AHFoundAnimalCard >> weight: anObject [

	weight := anObject
]
