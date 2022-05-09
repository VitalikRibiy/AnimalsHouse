"
Represents concreate class of breed
"
Class {
	#name : #DogBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
DogBreed class >> addWithName: nameValue avgSize: avgSizeValue avgLifespan: avgLifeSpanValue avgDailySleep: avgDailySleepValue avgSpeed: avgSpeedValue [
	|instance|
	instance := self new.
	instance name: nameValue; avgSize: avgSizeValue; avgLifespan: avgLifeSpanValue; avgDailySleep: avgDailySleepValue; avgSpeed: avgSpeedValue.
	breeds put: instance.
]

{ #category : #'instance creation' }
DogBreed class >> addWithName: nameValue avgSize: avgSizeValue avgWeight: avgWeightValue avgLifespan: avgLifeSpanValue avgDailySleep: avgDailySleepValue avgSpeed: avgSpeedValue [
	|instance|
	instance := self new.
	instance name: nameValue; avgSize: avgSizeValue; avgWeight: avgWeightValue; avgLifespan: avgLifeSpanValue; avgDailySleep: avgDailySleepValue; avgSpeed: avgSpeedValue.
	breeds put: instance.
]

{ #category : #accessing }
DogBreed class >> breedsList [
	^ breeds.
]

{ #category : #'instance creation' }
DogBreed class >> new [
	((breeds isNotNil) and: (breeds isNotEmpty)) ifTrue: [ ^self ]
	ifFalse: [	
			self initialize. 
			breeds := Array new. 
			self addWithName: '–Ñ–≥–∏–ø–µ—Ç—Å—å–∫–∏–π' avgSize: 24 avgWeight: 4 avgLifespan: 15 avgDailySleep: 15 avgSpeed:10;
			addWithName: '–ë—Ä–∏—Ç–∞–Ω—Å—å–∫–∏–π' avgSize: 24 avgWeight: 4 avgLifespan: 15 avgDailySleep: 15 avgSpeed:10;
			addWithName: '–Ü—Ä–ª–∞–Ω–¥—Å—å–∫–∏–π' avgSize: 24 avgWeight: 4 avgLifespan: 15 avgDailySleep: 15 avgSpeed:10;
			addWithName: '–ë–µ–Ω–≥–∞–ª—å—Å—å–∫–∏–π' avgSize: 24 avgWeight: 4 avgLifespan: 15 avgDailySleep: 15 avgSpeed:10;
			addWithName: '–ú–∞–Ω—á–∫—ñ–Ω' avgSize: 24 avgWeight: 4 avgLifespan: 15 avgDailySleep: 15 avgSpeed:10 
	]
]
