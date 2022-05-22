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
		'species',
		'breed',
		'weight',
		'healthStatus',
		'description',
		'donationProgress',
		'image'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #demo }
Animal class >> createDemoData [
	AHAdministrator login: 'admin' password: 'test'.
	CatBreed initialize. DogBreed initialize.
	CatBreed withName: 'British' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Irish' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Munchkin' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Husky' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Labrador' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'ToyTerier' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	Cat withName: 'Happy' age: 1 sex: Sex male  breed: (CatBreed getByName: 'British') weight: 5 healthStatus: 'Healthy' description: 'Lovely British' donationProgress: #(0 100) image: nil.
	Cat withName: 'Heddy' age: 1 sex: Sex female  breed: (CatBreed getByName: 'British') weight: 5 healthStatus: 'Healthy' description: 'Lovely British' donationProgress: #(0 100) image: nil.
	Cat withName: 'Erl' age: 1 sex: Sex male  breed: (CatBreed getByName: 'Irish') weight: 5 healthStatus: 'Healthy' description: 'Lovely Irish' donationProgress: #(0 100) image: nil.
	Cat withName: 'Essy' age: 1 sex: Sex female  breed: (CatBreed getByName: 'Irish') weight: 5 healthStatus: 'Healthy' description: 'Lovely Irish' donationProgress: #(0 100) image: nil.
	Cat withName: 'Puffy' age: 1 sex: Sex female  breed: (CatBreed getByName: 'Munchkin') weight: 5 healthStatus: 'Healthy' description: 'Lovely Munchkin' donationProgress: #(0 100) image: nil.
	Cat withName: 'Plummy' age: 1 sex: Sex male  breed: (CatBreed getByName: 'Munchkin') weight: 5 healthStatus: 'Healthy' description: 'Lovely Munchkin' donationProgress: #(0 100) image: nil.
	Dog withName: 'Jozy' age: 1 sex: Sex female  breed: (DogBreed getByName: 'Husky') weight: 5 healthStatus: 'Healthy' description: 'Lovely Husky' donationProgress: #(0 100) image: nil.
	Dog withName: 'Sansa' age: 1 sex: Sex female  breed: (DogBreed getByName: 'Husky') weight: 5 healthStatus: 'Healthy' description: 'Lovely Husky' donationProgress: #(0 100) image: nil.
	Dog withName: 'Jenny' age: 1 sex: Sex female  breed: (DogBreed getByName: 'Husky') weight: 5 healthStatus: 'Healthy' description: 'Lovely Husky' donationProgress: #(0 100) image: nil.
	Dog withName: 'Jo' age: 1 sex: Sex male  breed: (DogBreed getByName: 'Husky') weight: 5 healthStatus: 'Healthy' description: 'Lovely Husky' donationProgress: #(0 100) image: nil.
	Dog withName: 'Fred' age: 1 sex: Sex male  breed: (DogBreed getByName: 'ToyTerier') weight: 5 healthStatus: 'Healthy' description: 'Lovely ToyTerier' donationProgress: #(0 100) image: nil.
	Dog withName: 'Finny' age: 1 sex: Sex female  breed: (DogBreed getByName: 'ToyTerier') weight: 5 healthStatus: 'Healthy' description: 'Lovely ToyTerier' donationProgress: #(0 100) image: nil.
	Dog withName: 'Archi' age: 1 sex: Sex male  breed: (DogBreed getByName: 'Labrador') weight: 5 healthStatus: 'Healthy' description: 'Lovely Labrador' donationProgress: #(0 100) image: nil.
	Dog withName: 'Ally' age: 1 sex: Sex female  breed: (DogBreed getByName: 'Labrador') weight: 5 healthStatus: 'Healthy' description: 'Lovely Labrador' donationProgress: #(0 100) image: nil.
]

{ #category : #demo }
Animal class >> createSmallDemoData [
	AHAdministrator login: 'admin' password: 'test'.
	CatBreed initialize. DogBreed initialize.
	CatBreed withName: 'Not purebred' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'British' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Irish' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Munchkin' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Not purebred' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Husky' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Labrador' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'ToyTerier' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
]

{ #category : #initialization }
Animal class >> initialize [
	self reset.
]

{ #category : #initialization }
Animal class >> initializeVoyageOnMemoryDB [
	| repository |
	repository := VOMongoRepository database: 'AnimalsHouse'.
	repository enableSingleton.
]

{ #category : #testing }
Animal class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Animal class >> new [
	self == Animal ifTrue: [
			^ self error: 'Animal is an abstract class.  Make a concrete subclass.' ].
		^ super new
]

{ #category : #initialization }
Animal class >> reset [
	self initializeVoyageOnMemoryDB
]

{ #category : #'instance creation' }
Animal class >> withName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue donationProgress: donationProgressValue image: imageValue [
	| instance |
	instance := self new.
	instance name: nameValue; 
	age: ageValue; 
	sex: sexValue;
	breed: breedValue;
	weight: weightValue; 
	healthStatus: healthStatusValue; 
	description: descriptionValue; 
	donationProgress: donationProgressValue;
	image: imageValue;
	species: self class.
	instance save.
	^ instance.
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
	(anObject isBreed) 
	ifTrue: [ 
		((self isCat and: anObject class == CatBreed) or: (self isDog and: anObject class == DogBreed))
		ifTrue: [ breed := anObject ]
		ifFalse: [ self error: 'breed object do not correspond to animal specie' ] 
		]  
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

{ #category : #accessing }
Animal >> image [

	^ image
]

{ #category : #accessing }
Animal >> image: anObject [

	image := anObject
		         ifNil: [ 
			         '<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 233.554 233.554" style="enable-background:new 0 0 233.554 233.554;" xml:space="preserve">
<g>
	<path d="M42.32,146.242c9.466,0,17.164-10.334,17.164-23.038c0-12.704-7.698-23.038-17.164-23.038
		c-9.468,0-17.166,10.334-17.166,23.038C25.154,135.908,32.852,146.242,42.32,146.242z"/>
	<path d="M83.236,146.242c9.456,0,17.164-10.334,17.164-23.038c0-12.704-7.707-23.038-17.164-23.038
		c-9.468,0-17.166,10.334-17.166,23.038C66.07,135.908,73.768,146.242,83.236,146.242z"/>
	<path d="M115.279,134.751c-7.445-1.466-14.79,5.101-16.732,14.963c-1.939,9.851,2.367,18.714,9.813,20.179
		c7.437,1.464,14.791-5.103,16.73-14.954C127.032,145.078,122.715,136.215,115.279,134.751z"/>
	<path d="M27.007,149.714c-1.942-9.862-9.286-16.429-16.732-14.963c-7.436,1.464-11.753,10.326-9.811,20.189
		c1.939,9.851,9.293,16.418,16.73,14.954C24.64,168.428,28.946,159.565,27.007,149.714z"/>
	<path d="M88.687,175.066c-2.02-12.482-12.867-22.045-25.91-22.045c-13.043,0-23.891,9.563-25.91,22.045
		c-9.284,4.05-15.791,13.313-15.791,24.071c0,14.475,11.776,26.251,26.251,26.251c5.772,0,11.112-1.877,15.451-5.047
		c4.338,3.17,9.678,5.047,15.451,5.047c14.475,0,26.251-11.776,26.251-26.251C104.479,188.379,97.97,179.116,88.687,175.066z"/>
	<path d="M150.32,54.242c9.466,0,17.164-10.334,17.164-23.038c0-12.704-7.698-23.038-17.164-23.038
		c-9.468,0-17.166,10.334-17.166,23.038C133.154,43.908,140.852,54.242,150.32,54.242z"/>
	<path d="M191.236,54.242c9.456,0,17.164-10.334,17.164-23.038c0-12.704-7.707-23.038-17.164-23.038
		c-9.468,0-17.166,10.334-17.166,23.038C174.07,43.908,181.768,54.242,191.236,54.242z"/>
	<path d="M223.279,42.751c-7.445-1.466-14.79,5.101-16.732,14.963c-1.939,9.851,2.367,18.714,9.813,20.179
		c7.437,1.464,14.791-5.103,16.73-14.954C235.032,53.078,230.715,44.215,223.279,42.751z"/>
	<path d="M125.194,77.894c7.445-1.466,11.752-10.329,9.813-20.179c-1.942-9.862-9.286-16.429-16.732-14.963
		c-7.436,1.464-11.753,10.326-9.811,20.189C110.404,72.791,117.758,79.358,125.194,77.894z"/>
	<path d="M196.687,83.066c-2.02-12.482-12.867-22.045-25.91-22.045c-13.043,0-23.891,9.563-25.91,22.045
		c-9.284,4.05-15.791,13.313-15.791,24.071c0,14.475,11.776,26.251,26.251,26.251c5.772,0,11.112-1.877,15.451-5.047
		c4.338,3.17,9.678,5.047,15.451,5.047c14.475,0,26.251-11.776,26.251-26.251C212.479,96.379,205.97,87.116,196.687,83.066z"/>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
<g>
</g>
</svg>
' ]
		         ifNotNil: [ anObject ]
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
Animal >> species [
	^ species
]

{ #category : #accessing }
Animal >> species: anObject [
	(anObject == 'Cat' or: anObject == 'Dog')
	ifTrue: [ species := anObject ]
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
