Class {
	#name : #AHRegisterModal,
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
AHRegisterModal >> email [

	^ email
]

{ #category : #accessing }
AHRegisterModal >> email: anObject [

	email := anObject
]

{ #category : #accessing }
AHRegisterModal >> firstName [

	^ firstName
]

{ #category : #accessing }
AHRegisterModal >> firstName: anObject [

	firstName := anObject
]

{ #category : #accessing }
AHRegisterModal >> lastName [

	^ lastName
]

{ #category : #accessing }
AHRegisterModal >> lastName: anObject [

	lastName := anObject
]

{ #category : #accessing }
AHRegisterModal >> login [

	^ login
]

{ #category : #accessing }
AHRegisterModal >> login: anObject [

	login := anObject
]

{ #category : #accessing }
AHRegisterModal >> password [

	^ password
]

{ #category : #accessing }
AHRegisterModal >> password: anObject [

	password := anObject
]

{ #category : #accessing }
AHRegisterModal >> phoneNumber [

	^ phoneNumber
]

{ #category : #accessing }
AHRegisterModal >> phoneNumber: anObject [

	phoneNumber := anObject
]

{ #category : #rendering }
AHRegisterModal >> renderBodyOn: html [

	html modalBody: [ 
		html form
			multipart;
			style:
						'color: black; font-size: medium; display: flex; flex-direction: column';
			with: [ 
				self renderUserInfoOn: html.
				self renderLoginFieldOn: html.
				self renderPasswordFieldOn: html.
				html modalFooter: [ self renderButtonsOn: html ] ] ]
]

{ #category : #rendering }
AHRegisterModal >> renderButtonsOn: html [
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
AHRegisterModal >> renderContentOn: html [
	html modal
		id: 'registerModalDialog';
		with: [ 
			html modalDialog with: [ 
				html modalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
AHRegisterModal >> renderHeaderOn: html [
	html modalHeader: [ 
		html modalTitle
			level5;
			style: 'color: black';
			with: 'Реєстрація'.
			html modalCloseButton. ]
]

{ #category : #rendering }
AHRegisterModal >> renderLoginFieldOn: html [
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
AHRegisterModal >> renderPasswordFieldOn: html [
	html formGroup: [
	html label with: 'Пароль'.
	html passwordInput
		formControl;
		required;
		callback: [ :value | self password: value ];
		value: password ]

]

{ #category : #rendering }
AHRegisterModal >> renderUserInfoOn: html [
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
AHRegisterModal >> validate [

	AHUser withLogin: login password: password userInfo: (AHUserInfo
			 withFirstName: firstName
			 lastName: lastName
			 phoneNumber: phoneNumber
			 email: email).
	component tryConnectionWithLogin: login andPassword: password
]
