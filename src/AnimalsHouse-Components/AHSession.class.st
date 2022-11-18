Class {
	#name : #AHSession,
	#superclass : #WASession,
	#instVars : [
		'currentUser'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHSession >> currentUser [

	^ currentUser
]

{ #category : #accessing }
AHSession >> currentUser: anObject [

	currentUser := anObject
]

{ #category : #testing }
AHSession >> isLogged [
	^ self currentUser notNil
]

{ #category : #initialization }
AHSession >> reset [
	currentUser := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
