"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

Instance Variables
	avgDailySleep:		<Number>
	avgLifespan:		<Number>
	avgSize:		<Number>
	avgSpeed:		<Number>


    Implementation Points
"
Class {
	#name : #Breed,
	#superclass : #Object,
	#instVars : [
		'name',
		'avgSize',
		'avgLifespan',
		'avgDailySleep',
		'avgSpeed',
		'avgWeight'
	],
	#classInstVars : [
		'breeds'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #adding }
Breed class >> add: breedObject [
	self breeds isNotNil 
	   ifTrue: [ 
			(breeds anySatisfy: [ :e | e name = breedObject name. ]) 
			ifTrue: [ self error: 'This bread already exists'. ]
			ifFalse: [ breeds addLast: breedObject. ]
			]
		ifFalse: [ breeds := OrderedCollection with: breedObject. ].
]

{ #category : #accessing }
Breed class >> breeds [
	^ breeds.
]

{ #category : #accessing }
Breed class >> getByName: nameOfBreed [
	| result |
	result := (self breeds select: [ :e | e name = nameOfBreed ]).
	result isNotEmpty ifTrue: [ ^ result at: 1 ]
	ifFalse: [ self error: 'Breed with name:',nameOfBreed, 'does not exist' ]
]

{ #category : #'instance creation' }
Breed class >> new [
self == Breed ifTrue: [
		^ self error: 'Breed is an abstract class.  Make a concrete subclass.' ].
	^ super new
]

{ #category : #'instance creation' }
Breed class >> withName: nameValue avgSize: avgSizeValue avgWeight: avgWeightValue avgLifespan: avgLifeSpanValue avgDailySleep: avgDailySleepValue avgSpeed: avgSpeedValue [
	| instance |
	self == Breed ifTrue: [
		^ self error: 'Breed is an abstract class.  Make a concrete subclass.' ].
	instance := self new.
	instance name: nameValue; 
			   avgSize: avgSizeValue;
			   avgWeight: avgWeightValue;
			   avgLifespan: avgLifeSpanValue;
			   avgDailySleep: avgDailySleepValue;
			   avgSpeed: avgSpeedValue.
   self add: instance.
	^ instance.
]

{ #category : #accessing }
Breed >> avgDailySleep [

	^ avgDailySleep
]

{ #category : #accessing }
Breed >> avgDailySleep: dailySleep [
	dailySleep isNumber 
	ifTrue: [ avgDailySleep := dailySleep ]  
	ifFalse: [ self error: 'dailySleep should be a number' ]
]

{ #category : #accessing }
Breed >> avgLifespan [

	^ avgLifespan
]

{ #category : #accessing }
Breed >> avgLifespan: lifespan [
	lifespan isNumber 
	ifTrue: [ avgLifespan := lifespan ]  
	ifFalse: [ self error: 'lifespan should be a number' ]
]

{ #category : #accessing }
Breed >> avgSize [

	^ avgSize
]

{ #category : #accessing }
Breed >> avgSize: size [
	size isNumber 
	ifTrue: [ avgSize := size ]  
	ifFalse: [ self error: 'size should be a number' ]
]

{ #category : #accessing }
Breed >> avgSpeed [

	^ avgSpeed
]

{ #category : #accessing }
Breed >> avgSpeed: speed [
	speed isNumber 
	ifTrue: [ avgSpeed  := speed ]  
	ifFalse: [ self error: 'speed should be a number' ]
]

{ #category : #accessing }
Breed >> avgWeight [

	^ avgWeight
]

{ #category : #accessing }
Breed >> avgWeight: anObject [
	anObject isNumber 
	ifTrue: [ avgWeight := anObject ]  
	ifFalse: [ self error: 'weight should be a number' ]
]

{ #category : #accessing }
Breed >> isBreed [
	^ true.
]

{ #category : #accessing }
Breed >> name [

	^ name
]

{ #category : #accessing }
Breed >> name: nameValue [
	nameValue isByteString  
	ifTrue: [ name := nameValue ]  
	ifFalse: [ self error: 'name should be an instance of ByteString' ]
]
