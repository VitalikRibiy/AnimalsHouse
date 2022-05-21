Class {
	#name : #AHAdministrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHAdministrator class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
AHAdministrator class >> login: login password: password [
	| instance |
	instance := self new
		login: login;
		password: password.
	instance save.
	^ instance.
]

{ #category : #accessing }
AHAdministrator >> login [

	^ login
]

{ #category : #accessing }
AHAdministrator >> login: anObject [

	login := anObject
]

{ #category : #accessing }
AHAdministrator >> password [

	^ password
]

{ #category : #accessing }
AHAdministrator >> password: anObject [

	password := SHA256 hashMessage: anObject
]
