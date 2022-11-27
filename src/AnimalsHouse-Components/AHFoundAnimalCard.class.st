Class {
	#name : #AHFoundAnimalCard,
	#superclass : #AHBasicCard,
	#instVars : [
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

	image := anObject.
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
			self renderAnimalImageOn: html with: data photo.
			html cardBody: [ 
					html cardTitle level5 with:
							data contactName , ',' , data contactPhone.
					html cardSubtitle
						level6;
						mutedText;
						with: data place , ',' , data description.
					html formButton bePrimary
						dataToggle: 'modal';
						dataTarget: '#AddAnimalModal' , data id;
						with: 'Зареєструвати' ] ].
	html modal
		id: 'AddAnimalModal' , data id;
		with: [ 
			html modalDialog with: [ 
					html modalContent: [ 
							html modalHeader: [ 
									html modalTitle
										level5;
										with: 'Зареєструвати тварину'.
									html modalCloseButton ].
							self renderFormBodyOn: html ] ] ]
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
				html select list: (Species breedsOf: data animalSpecies);
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

{ #category : #actions }
AHFoundAnimalCard >> reset [
	name := nil.
	age := nil.
	sex := nil.
	species := data animalSpecies.
	breed := (Species breedsOf: species) asArray at: 1.
	weight := nil.
	healthStatus := nil.
	description := nil.
	image := nil. 
]

{ #category : #actions }
AHFoundAnimalCard >> save [

	| selectedClass |
	selectedClass := data animalSpecies = Species cat
		                 ifTrue: [ Cat ]
		                 ifFalse: [ Dog ].
	image ifNil: [ image := data photo ].
	selectedClass
		withName: name
		age: age
		sex: sex
		breed: breed
		weight: weight
		healthStatus: healthStatus
		description: description
		image: (self saveImage: image).
	data remove
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
