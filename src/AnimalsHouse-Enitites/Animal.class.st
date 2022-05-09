"
This class represents abstract class of an animal
 
Instance Variables
	age:		<Number>
	breed:		<Breed>
	description:		<ByteString>
	donationProgress:		<Array>
	healthStatus:		<HealthStatus>
	name:		<ByteString>
	sex:		<Sex>
	weight:		<Number>
"
Class {
	#name : #Animal,
	#superclass : #Object,
	#instVars : [
		'name',
		'age',
		'sex',
		'breed',
		'weight',
		'healthStatus',
		'description',
		'donationProgress'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
Animal class >> new [
	self subclassResponsibility.
]

{ #category : #'instance creation' }
Animal class >> withName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue donationProgress: donationProgressValue [
	^ self subclassResponsibility
]

{ #category : #accessing }
Animal >> age [

	^ age
]

{ #category : #accessing }
Animal >> age: anObject [
	anObject isNumber 
	ifTrue: [ age := anObject ]  
	ifFalse: [ self error: 'age should be an instance of number' ]
]

{ #category : #accessing }
Animal >> breed [

	^ breed
]

{ #category : #accessing }
Animal >> breed: anObject [
	(anObject isMemberOf: Breed) 
	ifTrue: [ breed := anObject ]  
	ifFalse: [ self error: 'breed: should be an instance of Breed' ]
]

{ #category : #accessing }
Animal >> description [

	^ description
]

{ #category : #accessing }
Animal >> description: desc [
	desc isByteString 
	ifTrue: [ description := desc ]  
	ifFalse: [ self error: 'description should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> donationProgress [

	^ donationProgress
]

{ #category : #accessing }
Animal >> donationProgress: progress [
	progress isArray 
	ifTrue: [ donationProgress  := progress ]  
	ifFalse: [ self error: 'donationProgress should be an instance of Array with 2 numbers' ]
]

{ #category : #accessing }
Animal >> healthStatus [

	^ healthStatus
]

{ #category : #accessing }
Animal >> healthStatus: status [
	status isByteString 
	ifTrue: [ healthStatus := status ]  
	ifFalse: [ self error: 'healthStatus should be an instance of ByteString' ]
]

{ #category : #testing }
Animal >> isCat [
	^ self subclassResponsibility
]

{ #category : #testing }
Animal >> isDog [
	^ self subclassResponsibility
]

{ #category : #accessing }
Animal >> name [

	^ name
]

{ #category : #accessing }
Animal >> name: nameValue [
	nameValue isByteString 
	ifTrue: [ name := nameValue ]  
	ifFalse: [ self error: 'name should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> sex [

	^ sex
]

{ #category : #accessing }
Animal >> sex: sexValue [
	sexValue isByteString
	ifTrue: [ sex := sexValue ]  
	ifFalse: [ self error: 'sex should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> weight [

	^ weight
]

{ #category : #accessing }
Animal >> weight: anObject [
	anObject isNumber 
	ifTrue: [ weight := anObject ]  
	ifFalse: [ self error: 'weight should be an instance of number' ]
]
