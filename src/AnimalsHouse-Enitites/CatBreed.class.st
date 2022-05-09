"
Represents concreat class of breeed
"
Class {
	#name : #CatBreed,
	#superclass : #Breed,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
CatBreed class >> addWithName: nameValue avgSize: avgSizeValue avgWeight: avgWeightValue avgLifespan: avgLifeSpanValue avgDailySleep: avgDailySleepValue avgSpeed: avgSpeedValue [
	|instance|
	instance := self new.
	instance name: nameValue; avgSize: avgSizeValue; avgWeight: avgWeightValue; avgLifespan: avgLifeSpanValue; avgDailySleep: avgDailySleepValue; avgSpeed: avgSpeedValue.
	breeds put: instance.
]

{ #category : #accessing }
CatBreed class >> breedsList [
	^ breeds.
]

{ #category : #'instance creation' }
CatBreed class >> new [

	(breeds isNotNil and: breeds isNotEmpty) ifTrue: [ ^ self ].
	breeds isNotNil ifFalse: [self initialize].
	breeds := Array new.
	self
		addWithName: '–•–∞—Å–∫—ñ'
			avgSize: 55
			avgWeight: 21
			avgLifespan: 13
			avgDailySleep: 11
			avgSpeed: 16;
		addWithName: '–ù—ñ–º–µ—Ü—å–∫–∞ –í—ñ–≤—á–∞—Ä–∫–∞'
			avgSize: 55
			avgWeight: 21
			avgLifespan: 13
			avgDailySleep: 11
			avgSpeed: 16;
		addWithName: '–ü—É–¥–µ–ª—å'
			avgSize: 55
			avgWeight: 21
			avgLifespan: 13
			avgDailySleep: 11
			avgSpeed: 16;
		addWithName: '–ö–æ—Ä–≥—ñ'
			avgSize: 55
			avgWeight: 21
			avgLifespan: 13
			avgDailySleep: 11
			avgSpeed: 16;
		addWithName: '–õ–∞–±—Ä–∞–¥–æ—Ä'
			avgSize: 55
			avgWeight: 21
			avgLifespan: 13
			avgDailySleep: 11
			avgSpeed: 16
]
