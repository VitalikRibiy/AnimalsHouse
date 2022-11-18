Class {
	#name : #AHUserInfo,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName',
		'phoneNumber',
		'email'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #'instance creation' }
AHUserInfo class >> withFirstName: firstNameValue lastName: lastNameValue phoneNumber: phoneNumberValue email: emailValue [
	| instance |
	instance := self new.
	instance firstName: firstNameValue;
		lastName: lastNameValue;
		phoneNumber: phoneNumberValue;
		email: emailValue.
	^ instance.
]

{ #category : #accessing }
AHUserInfo >> email [

	^ email
]

{ #category : #accessing }
AHUserInfo >> email: anObject [

	email := anObject
]

{ #category : #accessing }
AHUserInfo >> firstName [

	^ firstName
]

{ #category : #accessing }
AHUserInfo >> firstName: anObject [

	firstName := anObject
]

{ #category : #testing }
AHUserInfo >> isUserInfo [
	^ true.
]

{ #category : #accessing }
AHUserInfo >> lastName [

	^ lastName
]

{ #category : #accessing }
AHUserInfo >> lastName: anObject [

	lastName := anObject
]

{ #category : #accessing }
AHUserInfo >> phoneNumber [

	^ phoneNumber
]

{ #category : #accessing }
AHUserInfo >> phoneNumber: anObject [

	phoneNumber := anObject
]
