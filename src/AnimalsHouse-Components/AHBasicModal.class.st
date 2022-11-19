Class {
	#name : #AHBasicModal,
	#superclass : #SBSComponent,
	#instVars : [
		'component'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHBasicModal class >> from: aComponent [
	^ self new
	 component: aComponent;
	yourself
]

{ #category : #accessing }
AHBasicModal >> component [

	^ component
]

{ #category : #accessing }
AHBasicModal >> component: anObject [

	component := anObject
]
