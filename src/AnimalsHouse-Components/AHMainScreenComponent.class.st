Class {
	#name : #AHMainScreenComponent,
	#superclass : #AHScreenComponent,
	#instVars : [
		'carousel',
		'grid',
		'showLoginError',
		'adminView',
		'takenAnimalsView'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToAdministrationView [
	self call: adminView.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToMainView [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> goToTakenAnimalsView [
	
	self call: takenAnimalsView.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialization }
AHMainScreenComponent >> initialize [

	super initialize.
	carousel := AHCarouselPhotos new.
	grid := AHAnimalsGrid from: self.
	takenAnimalsView := AHTakenAnimalsComponent new.
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
		style:
			'display: inline-flex; flex-direction: column; vertical-align: top;';
		extraLargeSize: 12;
		with: [ 
			self renderLoginErrorMessageIfAnyOn: html.
			html row
				style: 'justify-content: center; max-height: 300px';
				with: carousel.
			html row
				style:
					'display:flex; flex-direction: column; align-items: center;';
				justifyContentCenterVeryLarge;
				with: [ 
					html heading
						style: 'padding-top: 10px; marigin-bottom: 0px;';
						level2;
						with: 'Знайшли тварину? Допоможіть нам знайти їй домівку:'.
					html column
						style: 'text-align: center';
						extraLargeSize: 2;
						with: (FoundAnimalModal from: self).
					html heading
						level2;
						with: 'Станьте власником чотирилапого чуда!' ].
			html row
				style: 'height: 50%; min-height: 400px';
				with: [ 
					html column
						extraLargeSize: 6;
						extraLargeOffset: 3;
						mediumSize: 8;
						mediumOffset: 2;
						with: grid ] ].
	self renderFooterOn: html
]

{ #category : #rendering }
AHMainScreenComponent >> renderLoginErrorMessageIfAnyOn: html [
	self hasLoginError ifFalse: [ ^ self ].
	showLoginError := false.
	html alert
		beDanger;
		with: self loginErrorMessage
]

{ #category : #initialization }
AHMainScreenComponent >> resetAdminView [
	adminView := AHAdminComponent new.
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> tryConnectionWithLogin: login andPassword: password [
	| user |
	user := self userWithLogin: login.
	user ifNil: [ self loginErrorOccurred ].
	(login = user login and: [ (SHA256 hashMessage: password) = user password asByteArray ])
		ifTrue: [ 
			self session currentUser: user.
			user isAdministrator ifTrue:[
				self resetAdminView.
				self goToAdministrationView
			].
		]
		ifFalse: [ self loginErrorOccurred ]
]

{ #category : #'as yet unclassified' }
AHMainScreenComponent >> userWithLogin: login [
	^ AHUser selectOne: [ :e| e login = login ].
]
