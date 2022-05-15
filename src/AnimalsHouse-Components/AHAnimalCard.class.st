Class {
	#name : #AHAnimalCard,
	#superclass : #AnObsoleteWAComponent,
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
			with: [ 
			html html: self class imagePlaceHolderSVG.
			html cardBody: [ 
			html cardTitle level5 with: self name.
			html cardSubtitle 
				level6; 
				mutedText;
				with: self sex,',', self age.
			html formButton bePrimary with: 'Про мене' ] ].
	Transcript show: 'End'.
]

{ #category : #accessing }
AHAnimalCard >> sex [
	^ animal sex.
]
