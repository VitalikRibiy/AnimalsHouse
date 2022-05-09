"
Represents concreate class of animal
"
Class {
	#name : #Dog,
	#superclass : #Animal,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
Dog class >> new [
	^ self initialize.
]

{ #category : #'instance creation' }
Dog class >> withName: nameValue age: ageValue sex: sexValue breed: breedValue weight: weightValue healthStatus: healthStatusValue description: descriptionValue donationProgress: donationProgressValue [
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
Dog >> isCat [
	^ false.
]

{ #category : #testing }
Dog >> isDog [
	^ true.
]
