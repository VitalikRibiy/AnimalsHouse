Class {
	#name : #AHScreenComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'header',
		'showLoginError',
		'adminView'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #hooks }
AHScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
AHScreenComponent >> createHeaderComponent [
	^ AHHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> goToAdminView [
	
	self subclassResponsibility.
]

{ #category : #accessing }
AHScreenComponent >> goToMainView [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> goToReviewsView [
	
	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> goToTakenAnimalsView [

	self call: AHTakenAnimalsComponent new
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialization }
AHScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent.
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> loginErrorMessage [
	^ 'Incorrect login or password'
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> loginErrorOccurred [
	showLoginError := true.
]

{ #category : #rendering }
AHScreenComponent >> renderAdOn: html [

	html container
		style:
			'height: 100%; background-color: #6F9DC8;';
		with: [ html label with: 'Реклама' ]
]

{ #category : #rendering }
AHScreenComponent >> renderContentOn: html [

	html column
		style: 'display: flex; flex-direction: column; min-height: 100vh';
		with: [ 
			html row
				style: 'min-height: 8vh';
				with: [ html render: header ].
			html row
				style: 'min-height: 86vh';
				with: [ 
					html column
						style: 'justify-content: center;';
						extraLargeSize: 1;
						with: [ self renderAdOn: html ].
					html column
						extraLargeSize: 10;
						with: [ self renderMainContentOn: html ].
					html column
											style: 'justify-content: center;';
						extraLargeSize: 1;
						with: [ self renderAdOn: html ] ].
			html row
				style: 'min-height: 6vh';
				with: [ self renderFooterOn: html ] ]
]

{ #category : #rendering }
AHScreenComponent >> renderFooterOn: html [

	html row
		style:
			'width: 100%;background-color: #355070; margin-top: 1%; min-height: 25px;';
		with: [ html label: 'footer' ]
]

{ #category : #rendering }
AHScreenComponent >> renderLoginErrorMessageIfAnyOn: html [
	self hasLoginError ifFalse: [ ^ self ].
	showLoginError := false.
	html alert
		beDanger;
		with: self loginErrorMessage
]

{ #category : #rendering }
AHScreenComponent >> renderMainContentOn: html [
	
	^ self subclassResponsibility.
]

{ #category : #initialization }
AHScreenComponent >> resetAdminView [
	adminView := AHAdminComponent new.
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> tryConnectionWithLogin: login andPassword: password [

	| user |
	user := self userWithLogin: login.
	user ifNil: [ ^ self loginErrorOccurred ].
	(login = user login and: [ 
		 (SHA256 hashMessage: password) = user password asByteArray ])
		ifTrue: [ 
			self session currentUser: user.
			user isAdministrator ifTrue: [ 
				self resetAdminView.
				self goToAdminView ] ]
		ifFalse: [ ^ self loginErrorOccurred  ]
]

{ #category : #'as yet unclassified' }
AHScreenComponent >> userWithLogin: login [
	^ AHUser selectOne: [ :e| e login = login ].
]
