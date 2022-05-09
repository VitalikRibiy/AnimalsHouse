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

{ #category : #'instance creation' }
Breed class >> addWithName: nameValue avgSize: avgSizeValue avgWeight: avgWeightValue avgLifespan: avgLifeSpanValue avgDailySleep: avgDailySleepValue avgSpeed: avgSpeedValue [
	self subclassResponsibility.
]

{ #category : #accessing }
Breed class >> breedsList [
	self subclassResponsibility.
]

{ #category : #'instance creation' }
Breed class >> new [
	self subclassResponsibility.
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
