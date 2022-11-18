Class {
	#name : #AHUser,
	#superclass : #Object,
	#instVars : [
		'login',
		'password',
		'userInfo'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHUser class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
AHUser class >> withLogin: login password: password userInfo: userInfoObject [
	| instance |
	instance := self new
		login: login;
		password: password;
		userInfo: userInfoObject.
	instance save.
	^ instance.
]

{ #category : #testing }
AHUser >> isAdministrator [
	^ false.
]

{ #category : #accessing }
AHUser >> login [

	^ login
]

{ #category : #accessing }
AHUser >> login: anObject [

	login := anObject
]

{ #category : #accessing }
AHUser >> password [

	^ password
]

{ #category : #accessing }
AHUser >> password: anObject [

	password := SHA256 hashMessage: anObject
]

{ #category : #accessing }
AHUser >> userInfo [

	^ userInfo
]

{ #category : #accessing }
AHUser >> userInfo: userInfoValue [
	
	userInfoValue isUserInfo ifTrue: [ userInfo := userInfoValue ] 
		ifFalse: [ self error: 'userInfo should be an instance of a AHUserInfo class' ]. 
	
]
