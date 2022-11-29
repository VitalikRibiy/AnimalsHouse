Class {
	#name : #AHAdministrator,
	#superclass : #AHUser,
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #accessing }
AHAdministrator class >> getInstance [

	^ self selectOne: [ :e | e login = 'admin' ]
]

{ #category : #testing }
AHAdministrator >> isAdministrator [
	^ true.
]
