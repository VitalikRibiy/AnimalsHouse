Class {
	#name : #AHAnimalCard,
	#superclass : #SBSComponent,
	#instVars : [
		'animal'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAnimalCard >> age [
	^ animal age.
]

{ #category : #accessing }
AHAnimalCard >> animal: anObject [
	animal := anObject
]

{ #category : #accessing }
AHAnimalCard >> image [
	animal image ifNotNil: [ ^ animal image ] ifNil: [ ^ SBSCardExample imagePlaceHolderSVG ]
]

{ #category : #initialization }
AHAnimalCard >> initialize [
	super initialize.
]

{ #category : #accessing }
AHAnimalCard >> name [
	^ animal name.
]

{ #category : #rendering }
AHAnimalCard >> renderContentOn: html [
		html card
			style: 'margin: 15px';
			with: [ 
			html tbsImage
				style: 'display: flex; max-width: 100%; width: auto; height: auto';
				url: self image.
			html cardBody: [ 
			html cardTitle level5 with: self name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: self sex,',', self age printString.
			html formButton bePrimary with: 'Про мене' ] ]

]

{ #category : #accessing }
AHAnimalCard >> sex [
	^ animal sex.
]
