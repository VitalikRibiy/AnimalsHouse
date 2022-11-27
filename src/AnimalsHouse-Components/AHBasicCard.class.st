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

{ #category : #'as yet unclassified' }
AHBasicCard >> readImageFrom: fullPath [

	| file content stream |
	file := fullPath asFileReference.
	stream := file binaryReadStream.
	content := 'data:image/' , file path extension , ';base64,'
	           , (ZnBase64Encoder new encode: stream contents).
	stream close.
	^ content
]

{ #category : #rendering }
AHBasicCard >> renderAnimalImageOn: html with: image [

	html tbsImage
		beResponsive;
		style:
			'display: flex; max-width: 100%; width: auto; height: 200px; object-fit: cover;';
		url: (self readImageFrom: image)
]

{ #category : #accessing }
AHBasicCard >> saveImage: imageObject [

	| filepath |
	filepath := FileSystem disk workingDirectory / imageObject fileName.
	filepath binaryWriteStream
		nextPutAll: imageObject rawContents;
		close.
	^ filepath pathString.
]
