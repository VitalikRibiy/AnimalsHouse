Class {
	#name : #AHSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHSession >> currentAdmin [

	^ currentAdmin
]

{ #category : #accessing }
AHSession >> currentAdmin: anObject [

	currentAdmin := anObject
]

{ #category : #testing }
AHSession >> isLogged [
	^ self currentAdmin notNil
]

{ #category : #initialization }
AHSession >> reset [
	currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
