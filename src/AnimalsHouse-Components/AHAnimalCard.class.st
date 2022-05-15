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
			style: 'width: 18rem;';
			with: [ 
			html html: SBSCardExample imagePlaceHolderSVG.
			html cardBody: [ 
			html cardTitle level5 with: self name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: self sex,',', self age printString.
			html formButton bePrimary with: 'Про мене' ] ].
]

{ #category : #accessing }
AHAnimalCard >> sex [
	^ animal sex.
]
