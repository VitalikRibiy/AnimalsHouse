Class {
	#name : #AHGeneralGrid,
	#superclass : #SBSComponent,
	#instVars : [
		'sorting',
		'component'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHGeneralGrid class >> from: aComponent [
	^ self new
	 component: aComponent;
	yourself
]

{ #category : #accessing }
AHGeneralGrid >> component [
	^ component.
]

{ #category : #accessing }
AHGeneralGrid >> component: componentObject [
	component := componentObject.
]

{ #category : #'private - protocol' }
AHGeneralGrid >> getData [
	self subclassResponsibility.
]

{ #category : #rendering }
AHGeneralGrid >> renderContentOn: html [

	html column
		style:
			'background: #6F9DC8; paddign: 0px; height: inherit; border: 1px solid #355070;';
		extraLargeSize: 12;
		mediumSize: 12;
		smallSize: 12;
		with: [ 
			sorting isNotNil ifTrue: [ 
					html row
						style: 'background: #2e608f';
						with: sorting ].
			html row
				style: 'overflow-y:auto; overflow-x: hidden; max-height: 800px;';
				with: [ 
					self getData collect: [ :a | 
							html column
								extraLargeSize: 3;
								mediumSize: 4;
								smallSize: 6;
								with: a ] ] ]
]
