Class {
	#name : #AHReview,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'sender',
		'text',
		'type'
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
		            receiver: receiverObject;
		            sender: senderObject;
						type: typeObject;
		            save.
	^ instance
]

{ #category : #accessing }
AHReview >> receiver [

	^ receiver
]

{ #category : #accessing }
AHReview >> receiver: anObject [

	receiver := anObject
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
