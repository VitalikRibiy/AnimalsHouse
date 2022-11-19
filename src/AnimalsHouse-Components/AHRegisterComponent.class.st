Class {
	#name : #AHRegisterComponent,
	#superclass : #AHBasicModal,
	#instVars : [
		'login',
		'password',
		'firstName',
		'lastName',
		'phoneNumber',
		'email'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHRegisterComponent >> email [

	^ email
]

{ #category : #accessing }
AHRegisterComponent >> email: anObject [

	email := anObject
]

{ #category : #accessing }
AHRegisterComponent >> firstName [

	^ firstName
]

{ #category : #accessing }
AHRegisterComponent >> firstName: anObject [

	firstName := anObject
]

{ #category : #accessing }
AHRegisterComponent >> lastName [

	^ lastName
]

{ #category : #accessing }
AHRegisterComponent >> lastName: anObject [

	lastName := anObject
]

{ #category : #accessing }
AHRegisterComponent >> login [

	^ login
]

{ #category : #accessing }
AHRegisterComponent >> login: anObject [

	login := anObject
]

{ #category : #accessing }
AHRegisterComponent >> password [

	^ password
]

{ #category : #accessing }
AHRegisterComponent >> password: anObject [

	password := anObject
]

{ #category : #accessing }
AHRegisterComponent >> phoneNumber [

	^ phoneNumber
]

{ #category : #accessing }
AHRegisterComponent >> phoneNumber: anObject [

	phoneNumber := anObject
]

{ #category : #accessing }
AHRegisterComponent >> registerErrorMessage [
	^ 'Заповніть усі поля'
]

{ #category : #rendering }
AHRegisterComponent >> renderBodyOn: html [
	html modalBody: [
		
		html form multipart;
			style: 'color: black; font-size: small;';
			with: [
			self renderUserInfoOn: html.
			self renderLoginFieldOn: html.
			self renderPasswordFieldOn: html.
			html modalFooter: [ self renderButtonsOn: html ]
			] 
		]
]

{ #category : #rendering }
AHRegisterComponent >> renderButtonsOn: html [
	html tbsButton
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Скасувати'.
	html tbsSubmitButton
		bePrimary;
		callback: [ self validate ];
		value: 'Зареєструватись'
]

{ #category : #rendering }
AHRegisterComponent >> renderContentOn: html [
	html modal
		id: 'registerModalDialog';
		with: [ 
			html modalDialog with: [ 
				html modalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
AHRegisterComponent >> renderHeaderOn: html [
	html modalHeader: [ 
		html modalTitle
			level5;
			style: 'color: black';
			with: 'Реєстрація'.
			html modalCloseButton. ]
]

{ #category : #rendering }
AHRegisterComponent >> renderLoginFieldOn: html [
	html
	formGroup: [ 
		html label with: 'Логін'; style: 'color: #000000'.
		html textInput
			formControl;
			required;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self login: value ];
			value: login ]
]

{ #category : #rendering }
AHRegisterComponent >> renderPasswordFieldOn: html [
	html formGroup: [
	html label with: 'Пароль'.
	html passwordInput
		formControl;
		required;
		callback: [ :value | self password: value ];
		value: password ]

]

{ #category : #rendering }
AHRegisterComponent >> renderUserInfoOn: html [
	html
	formGroup: [ 
		html label with: 'Ім`я'.
		html textInput
			formControl;
			required;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self firstName: value ];
			value: firstName.
		html label with: 'Прізвище'.
		html textInput
			formControl;
			required;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self lastName: value ];
			value: lastName.
		html label with: 'Номер телефону'.
		html textInput
			formControl;
			required;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self phoneNumber: value ];
			value: phoneNumber.
		html label with: 'Електронна пошта'.
		html textInput
			formControl;
			required;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self email: value ];
			value: email.	
		]
]

{ #category : #accessing }
AHRegisterComponent >> validate [
	login notEmpty & 
	password notEmpty & 
	firstName notEmpty & 
	lastName notEmpty & 
	phoneNumber notEmpty & 
	email notEmpty
	ifTrue: [ (AHUser withLogin: login password: password userInfo:  (AHUserInfo withFirstName: firstName lastName: lastName phoneNumber: phoneNumber email: email)).
		component tryConnectionWithLogin: login andPassword: password.
		].
	
]
