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
		'animalSpecies',
		'breed',
		'weight',
		'healthStatus',
		'description',
		'image',
		'status',
		'owner',
		'reports'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #demo }
Animal class >> createDemoData [

	| baseImagePath admin user1 user2 animal wantedAnimal1 wantedAnimal2 wantedAnimal3 |
	baseImagePath := 'C:\Users\vribi\Documents\Pharo\images\Animals House\'.
	admin := AHAdministrator
		         withLogin: 'admin'
		         password: 'test'
		         userInfo: (AHUserInfo
				          withFirstName: 'Admin'
				          lastName: 'Admin'
				          phoneNumber: '0734940326'
				          email: 'VitalikRibiy@gmail.com').
	user1 := AHUser
		         withLogin: 'user'
		         password: 'test'
		         userInfo: (AHUserInfo
				          withFirstName: 'Vitalii'
				          lastName: 'Ribii'
				          phoneNumber: '0734940326'
				          email: 'VitalikRibiy@gmail.com').
	user2 := AHUser
		         withLogin: 'user2'
		         password: 'test'
		         userInfo: (AHUserInfo
				          withFirstName: 'Ostap'
				          lastName: 'Malets'
				          phoneNumber: '0504940326'
				          email: 'test@gmail.com').
	AHReview
		withText: 'sample positive text'
		receiver: admin
		sender: user1
		type: ReviewType positive.
	AHReview
		withText: 'sample negative text'
		receiver: admin
		sender: user2
		type: ReviewType negative.
	AHReview
		withText: 'sample positive text'
		receiver: admin
		sender: user1
		type: ReviewType positive.
	AHReview
		withText: 'sample negative text'
		receiver: admin
		sender: user2
		type: ReviewType negative.
	AHReview
		withText: 'sample positive text'
		receiver: user1
		sender: admin
		type: ReviewType positive.
	AHReview
		withText: 'sample negative text'
		receiver: user2
		sender: admin
		type: ReviewType negative.
	CatBreed initialize.
	DogBreed initialize.
	CatBreed
		withName: 'British'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	CatBreed
		withName: 'Irish'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	CatBreed
		withName: 'Munchkin'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	DogBreed
		withName: 'Husky'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	DogBreed
		withName: 'Labrador'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	DogBreed
		withName: 'ToyTerier'
		avgSize: 13
		avgWeight: 5
		avgLifespan: 13
		avgDailySleep: 16
		avgSpeed: 7.
	Cat
		withName: 'Happy'
		age: 1
		sex: Sex male
		breed: (CatBreed getByName: 'British')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely British'
		image: baseImagePath , 'БританськийСамець.jpg'.
	Cat
		withName: 'Heddy'
		age: 1
		sex: Sex female
		breed: (CatBreed getByName: 'British')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely British'
		image: baseImagePath , 'БританськаСамка.jpg'.
	Cat
		withName: 'Erl'
		age: 1
		sex: Sex male
		breed: (CatBreed getByName: 'Irish')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Irish'
		image: baseImagePath , 'ІрландецьСамець.jpg'.
	Cat
		withName: 'Essy'
		age: 1
		sex: Sex female
		breed: (CatBreed getByName: 'Irish')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Irish'
		image: baseImagePath , 'ІрландецьСамка.jpg'.
	Cat
		withName: 'Puffy'
		age: 1
		sex: Sex female
		breed: (CatBreed getByName: 'Munchkin')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Munchkin'
		image: baseImagePath , 'МанчкінСамка.jpg'.
	wantedAnimal1 := Cat
		                 withName: 'Plummy'
		                 age: 1
		                 sex: Sex male
		                 breed: (CatBreed getByName: 'Munchkin')
		                 weight: 5
		                 healthStatus: 'Healthy'
		                 description: 'Lovely Munchkin'
		                 image: baseImagePath , 'МанчкінСамець.jpg'.
	wantedAnimal2 := Dog
		                 withName: 'Jozy'
		                 age: 1
		                 sex: Sex female
		                 breed: (DogBreed getByName: 'Husky')
		                 weight: 5
		                 healthStatus: 'Healthy'
		                 description: 'Lovely Husky'
		                 image: baseImagePath , 'ХаскіСамка1.jpeg'.
	Dog
		withName: 'Sansa'
		age: 1
		sex: Sex female
		breed: (DogBreed getByName: 'Husky')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Husky'
		image: baseImagePath , 'ХаскіСамка2.jpg'.
	wantedAnimal3 := Dog
		                 withName: 'Jenny'
		                 age: 1
		                 sex: Sex female
		                 breed: (DogBreed getByName: 'Husky')
		                 weight: 5
		                 healthStatus: 'Healthy'
		                 description: 'Lovely Husky'
		                 image: baseImagePath , 'ХаскіСамка3.jfif'.
	Dog
		withName: 'Jo'
		age: 1
		sex: Sex male
		breed: (DogBreed getByName: 'Husky')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Husky'
		image: baseImagePath , 'ХаскіСамець.jpg'.
	Dog
		withName: 'Fred'
		age: 1
		sex: Sex male
		breed: (DogBreed getByName: 'ToyTerier')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely ToyTerier'
		image: baseImagePath , 'ТойТер`єрСамець.jpg'.
	Dog
		withName: 'Finny'
		age: 1
		sex: Sex female
		breed: (DogBreed getByName: 'ToyTerier')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely ToyTerier'
		image: baseImagePath , 'ТойТер`єрСамка.jpg'.
	Dog
		withName: 'Archi'
		age: 1
		sex: Sex male
		breed: (DogBreed getByName: 'Labrador')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Labrador'
		image: baseImagePath , 'ЛабрадорСамець.jpg'.
	Dog
		withName: 'Ally'
		age: 1
		sex: Sex female
		breed: (DogBreed getByName: 'Labrador')
		weight: 5
		healthStatus: 'Healthy'
		description: 'Lovely Labrador'
		image: baseImagePath , 'ЛабрадорСамка.jpg'.
	animal := Dog
		          withName: 'Braddy'
		          age: 2
		          sex: Sex male
		          breed: (DogBreed getByName: 'Labrador')
		          weight: 15
		          healthStatus: 'Healthy'
		          description: 'Чудовий лабрадор'
		          image: baseImagePath , 'ЛабрадорСамецьЗабрали.jpg'.
	animal
		status: AnimalStatus taken;
		owner: user1;
		addReport: (AHReport
				 withAnimal: animal
				 user: user1
				 image: baseImagePath , 'ЛабрадорСамецьЗабралиЗвіт1.jpg'
				 comment: 'Ми з ним щасливі, він виріс'
				 date: DateAndTime now);
		addReport: (AHReport
				 withAnimal: animal
				 user: user1
				 image: baseImagePath , 'ЛабрадорСамецьЗабралиЗвіт2.jpg'
				 comment: 'Він класний, йому з нами добре'
				 date: DateAndTime now);
		save.
	AHWantAnimal withAnimal: wantedAnimal1 user: user1.
	AHWantAnimal withAnimal: wantedAnimal2 user: user2.
	AHWantAnimal withAnimal: wantedAnimal3 user: user2.
	AHWantAnimal withAnimal: wantedAnimal2 user: user1.

	AHFoundAnimal
		withSpecies: Species dog
		contactName: 'Петро'
		contactPhone: '0953231434'
		animalPhoto: baseImagePath , 'ТойТерєрЗнайдений.jpg'
		animalDescription: 'Маленька собачка загубилася'
		animalPlace: 'Ходить біля базару'.
	AHFoundAnimal
		withSpecies: Species cat
		contactName: 'Тарас'
		contactPhone: '0953231425'
		animalPhoto: baseImagePath , 'МанчкінЗнайдено.jfif'
		animalDescription: 'Котик виглядає загубленим'
		animalPlace: 'Бігає парком'
]

{ #category : #demo }
Animal class >> createSmallDemoData [
	AHAdministrator withLogin: 'admin' password: 'test' userInfo: nil.
	CatBreed withName: 'Безпородний' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Британець' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Шотландець' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	CatBreed withName: 'Манчкін' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Безпородний' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Хаскі' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Лабрадор' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
	DogBreed withName: 'Той Тер`єр' avgSize: 13 avgWeight: 5 avgLifespan: 13 avgDailySleep: 16 avgSpeed: 7.
]

{ #category : #initialization }
Animal class >> initialize [
	self reset.
]

{ #category : #initialization }
Animal class >> initializeVoyageDB [
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
	self initializeVoyageDB
]

{ #category : #accessing }
Animal class >> takenPercent [

	^ ((100 / self count) asFloat
	   *
		   (self selectMany: [ :animal | animal status = AnimalStatus taken ])
			   size) rounded
]

{ #category : #'instance creation' }
Animal class >> testWithName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue image: imageValue [
	| instance |
	instance := self new.
	instance name: nameValue; 
	age: ageValue; 
	sex: sexValue;
	breed: breedValue;
	weight: weightValue; 
	healthStatus: healthStatusValue; 
	description: descriptionValue; 
	image: imageValue.
	^ instance.
]

{ #category : #'instance creation' }
Animal class >> withName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue image: imageValue [

	| instance |
	instance := self new.
	instance
		name: nameValue;
		age: ageValue;
		sex: sexValue;
		breed: breedValue;
		weight: weightValue;
		healthStatus: healthStatusValue;
		description: descriptionValue;
		image: imageValue;
		save.
	^ instance
]

{ #category : #adding }
Animal >> addReport: report [

	reports addLast: report.
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
Animal >> animalSpecies [
	^ animalSpecies
]

{ #category : #accessing }
Animal >> animalSpecies: object [
	animalSpecies := object.
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
	desc isString 
	ifTrue: [ description := desc ]  
	ifFalse: [ self error: 'description should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> healthStatus [

	^ healthStatus
]

{ #category : #accessing }
Animal >> healthStatus: status [
	status isString 
	ifTrue: [ healthStatus := status ]  
	ifFalse: [ self error: 'healthStatus should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> id [
	
	^ self voyageId value printStringHex.
]

{ #category : #accessing }
Animal >> image [

	image
		ifNotNil: [ :arg | ^ image ]
		ifNil: [ ^ SBSCardExample imagePlaceHolderSVG ]
		
	
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

{ #category : #initialization }
Animal >> initialize [

	super initialize.
	reports := OrderedCollection new.
	status := AnimalStatus inShelter
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
	nameValue isString 
	ifTrue: [ name := nameValue ]  
	ifFalse: [ self error: 'name should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> owner [
	
	^ owner.
]

{ #category : #accessing }
Animal >> owner: ownerUser [
	
	owner := ownerUser.
]

{ #category : #accessing }
Animal >> reports [

	^ reports
]

{ #category : #accessing }
Animal >> sex [

	^ sex
]

{ #category : #accessing }
Animal >> sex: sexValue [
	sexValue isString
	ifTrue: [ sex := sexValue ]  
	ifFalse: [ self error: 'sex should be an instance of ByteString' ]
]

{ #category : #accessing }
Animal >> status [

	^ status
]

{ #category : #accessing }
Animal >> status: anObject [

	status := anObject
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
