Class {
	#name : #AHAuthenticationModal,
	#superclass : #AHBasicModal,
	#instVars : [
		'password',
		'account'
	],
	#classInstVars : [
		'html'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHAuthenticationModal >> account [

	^ account
]

{ #category : #accessing }
AHAuthenticationModal >> account: anObject [

	account:= anObject
]

{ #category : #accessing }
AHAuthenticationModal >> password [

	^ password
]

{ #category : #accessing }
AHAuthenticationModal >> password: anObject [

	password := anObject
]

{ #category : #rendering }
AHAuthenticationModal >> renderAccountFieldOn: html [
		html label with: 'Логін'.
		html textInput
			formControl;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | self account: value ];
			value: account.
]

{ #category : #rendering }
AHAuthenticationModal >> renderBodyOn: html [

	html modalBody: [ 
		html form
			multipart;
			with: [ 
				html formGroup 			style:
				'color: black; font-size: medium; display: flex; flex-direction: column'; with: [ 
						html label with: 'Логін'.
						html textInput
							formControl;
							attributeAt: 'autofocus' put: 'true';
							callback: [ :value | self account: value ];
							value: account.

						html label with: 'Пароль'.
						html passwordInput
							formControl;
							callback: [ :value | self password: value ];
							value: password ] ].
		html modalFooter: [ self renderButtonsOn: html ] ]
]

{ #category : #rendering }
AHAuthenticationModal >> renderButtonsOn: html [
	html tbsButton
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Cancel'.
	html tbsSubmitButton
		bePrimary;
		callback: [ self validate ];
		value: 'SignIn'
]

{ #category : #rendering }
AHAuthenticationModal >> renderContentOn: html [
	html modal
		id: 'authModalDialog';
		with: [ 
			html modalDialog with: [ 
				html modalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
AHAuthenticationModal >> renderHeaderOn: html [
	html modalHeader: [ 
		html modalTitle
			level5;
			style: 'color: black';
			with: 'Authentication'.
			html modalCloseButton. ]
]

{ #category : #rendering }
AHAuthenticationModal >> renderPasswordFieldOn: html [
	html tbsFormGroup: [
	html label with: 'Пароль'.
	html passwordInput
		tbsFormControl;
		callback: [ :value | self password: value ];
		value: password ]

]

{ #category : #accessing }
AHAuthenticationModal >> validate [
	^ component tryConnectionWithLogin: self account andPassword: self password

]
