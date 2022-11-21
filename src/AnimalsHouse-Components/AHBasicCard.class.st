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

{ #category : #rendering }
AHBasicCard >> renderAnimalImageOn: html [
	
	html tbsImage
				style:
					'display: flex; max-width: 100%; width: auto; height: 200px; object-fit: cover;';
				url: data photo.
]

{ #category : #rendering }
AHBasicCard >> renderAnimalImageOn: html with: image [

	html tbsImage
		style:
			'display: flex; max-width: 100%; width: auto; height: 200px; object-fit: cover;';
		url: image
]
