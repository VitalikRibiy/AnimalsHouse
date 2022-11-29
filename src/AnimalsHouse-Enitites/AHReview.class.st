Class {
	#name : #AHReview,
	#superclass : #Object,
	#instVars : [
		'receiverUser',
		'sender',
		'text',
		'type',
		'date'
	],
	#category : #'AnimalsHouse-Enitites'
}

{ #category : #testing }
AHReview class >> isVoyageRoot [

	^ true.
]

{ #category : #'as yet unclassified' }
AHReview class >> withText: textObject receiver: receiverObject sender: senderObject type: typeObject [

	| instance |
	instance := self new
		            text: textObject;
		            receiverUser: receiverObject;
		            sender: senderObject;
		            type: typeObject;
		            date: DateAndTime now;
		            save.
	^ instance
]

{ #category : #accessing }
AHReview >> date [

	^ date.
]

{ #category : #accessing }
AHReview >> date: dateObject [

	date := dateObject. 
]

{ #category : #accessing }
AHReview >> receiverUser [

	^ receiverUser
]

{ #category : #accessing }
AHReview >> receiverUser: anObject [

	receiverUser := anObject
]

{ #category : #accessing }
AHReview >> sender [

	^ sender
]

{ #category : #accessing }
AHReview >> sender: anObject [

	sender := anObject
]

{ #category : #accessing }
AHReview >> text [

	^ text
]

{ #category : #accessing }
AHReview >> text: anObject [

	text := anObject
]

{ #category : #accessing }
AHReview >> type [

	^ type
]

{ #category : #accessing }
AHReview >> type: anObject [

	type := anObject
]
