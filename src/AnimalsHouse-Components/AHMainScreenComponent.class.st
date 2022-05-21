Class {
	#name : #AHMainScreenComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'carousel',
		'grid',
		'showLoginError'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #private }
AHMainScreenComponent >> admin [ 
	^ AHAdministrator selectAll at: 1.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToAdministrationView [
	self call: AHAdminComponent new.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialization }
AHMainScreenComponent >> initialize [
	super initialize.
	carousel := AHCarouselPhotos new.
	grid := AHCardsGrid new.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> loginErrorMessage [
	^ 'Incorrect login or password'
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> loginErrorOccurred [
	showLoginError := true.
]

{ #category : #rendering }
AHMainScreenComponent >> renderContentOn: html [
	super renderContentOn: html.
	html column
		style: 'height: 100%';
		extraLargeSize: 12; with: [
		self renderLoginErrorMessageIfAnyOn: html. 
		html row
			style: 'margin-top: 50px; margin-bottom: 50px;'; 
			with: [ html column extraLargeSize:6; extraLargeOffset: 3; with: carousel. ].
		html row justifyContentCenterVeryLarge;
			style: 'margin-top: 50px; margin-bottom: 50px;';
			with: [
			html column style: 'text-align: center'; extraLargeSize: 2; with: FoundAnimalModal new.
			html column style: 'text-align: center'; extraLargeSize: 2; with: WantAnimalModal new.
	 	].
		html row with: [ 
			html column extraLargeSize: 6; extraLargeOffset: 3; 
				mediumSize: 8; mediumOffset:2;
				with: grid.
		].
		html row 
			with: [
			html column style: 'padding:0px; text-align: center'; extraLargeSize: 12; with: footer. ]
	]
]

{ #category : #rendering }
AHMainScreenComponent >> renderLoginErrorMessageIfAnyOn: html [
	self hasLoginError ifFalse: [ ^ self ].
	showLoginError := false.
	html alert
		beDanger;
		with: self loginErrorMessage
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> tryConnectionWithLogin: login andPassword: password [
	| admin |
	admin := self admin.
	(login = admin login and: [ (SHA256 hashMessage: password) = admin password asByteArray ])
		ifTrue: [ self session currentAdmin: admin.
					 self goToAdministrationView ]
		ifFalse: [ self loginErrorOccurred ]
]
