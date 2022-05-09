"
Represents concreat class of Animal
"
Class {
	#name : #Cat,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
Cat class >> new [
	^ self initialize.
]

{ #category : #'instance creation' }
Cat class >> withName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue donationProgress: donationProgressValue [
	| instance |
	instance := self new.
	instance name: nameValue; 
	age: ageValue; 
	sex: sexValue; 
	breed: breedValue; 
	weight: weightValue; 
	healthStatus: healthStatusValue; 
	description: descriptionValue; 
	donationProgress: donationProgressValue.
	^instance.
]

{ #category : #testing }
Cat >> isCat [
	^ true.
]

{ #category : #testing }
Cat >> isDog [
	^ false.
]
