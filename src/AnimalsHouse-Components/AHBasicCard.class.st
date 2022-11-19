Class {
	#name : #AHBasicCard,
	#superclass : #SBSComponent,
	#instVars : [
		'component',
		'data'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHBasicCard class >> from: aComponent withData: data [
	^ self new
	 component: aComponent;
	 data: data
	yourself
]

{ #category : #accessing }
AHBasicCard >> component [ 
	^ component.
]

{ #category : #accessing }
AHBasicCard >> component: componentObject [
	component := componentObject.
]

{ #category : #accessing }
AHBasicCard >> data [

	^ data
]

{ #category : #accessing }
AHBasicCard >> data: anObject [

	data := anObject
]
