"
An AnimalTest is a test class for testing the behavior of Animal
"
Class {
	#name : #AnimalTest,
	#superclass : #TestCase,
	#instVars : [
		'testAnimal',
		'testBreed'
	],
	#category : #'AnimalsHouse-Enitites-Tests'
}

{ #category : #initialization }
AnimalTest >> setUp [
	testBreed := CatBreed testWithName: 'British' avgSize: 13 avgWeight: 5 avgLifespan: 15 avgDailySleep: 16 avgSpeed: 7.
	testAnimal := Cat testWithName: 'TestCatName' age: 1 sex: Sex female breed: testBreed weight: 5 healthStatus: 'Healthy' description: 'test description' image: nil.
	super setUp.
]

{ #category : #running }
AnimalTest >> tearDown [
	testAnimal := nil.
	testBreed := nil.
	



]

{ #category : #tests }
AnimalTest >> testAge [
	self assert: testAnimal age equals: 1.
]

{ #category : #tests }
AnimalTest >> testBreed [
	self assert: testAnimal breed equals: testBreed.
	

]

{ #category : #tests }
AnimalTest >> testDescription [
	self assert: testAnimal description equals: 'test description'.

]

{ #category : #tests }
AnimalTest >> testHealthStatus [
	self assert: testAnimal healthStatus equals: 'Healthy'.

]

{ #category : #tests }
AnimalTest >> testIsCat [
	self assert: testAnimal isCat equals: true.
]

{ #category : #tests }
AnimalTest >> testIsDog [
	self assert: testAnimal isDog equals: false.
]

{ #category : #tests }
AnimalTest >> testName [
	self assert: testAnimal name equals: 'TestCatName'.
	

]

{ #category : #tests }
AnimalTest >> testSex [
	self assert: testAnimal sex equals: Sex female.
	

]

{ #category : #tests }
AnimalTest >> testWeight [
	self assert: testAnimal weight equals: 5.

]
