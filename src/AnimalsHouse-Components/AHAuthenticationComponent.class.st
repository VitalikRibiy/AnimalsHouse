Class {
	#name : #AHAuthenticationComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#classInstVars : [
		'html'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHAuthenticationComponent class >> from: aComponent [
	^ self new
		component: aComponent;
		yourself.
]

{ #category : #accessing }
AHAuthenticationComponent >> account [

	^ account
]

{ #category : #accessing }
AHAuthenticationComponent >> account: anObject [

	account:= anObject
]

{ #category : #accessing }
AHAuthenticationComponent >> component [

	^ component
]

{ #category : #accessing }
AHAuthenticationComponent >> component: anObject [

	component := anObject
]

{ #category : #accessing }
AHAuthenticationComponent >> password [

	^ password
]

{ #category : #accessing }
AHAuthenticationComponent >> password: anObject [

	password := anObject
]

{ #category : #rendering }
AHAuthenticationComponent >> renderAccountFieldOn: html [
	html
	formGroup: [ 
		html label with: 'Account'.
		html textInput
			formControl;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | account := value ];
			value: account ]
]

{ #category : #rendering }
AHAuthenticationComponent >> renderBodyOn: html [
	html modalBody: [
		html form: [
			self renderAccountFieldOn: html.
			self renderPasswordFieldOn: html.
			html modalFooter: [ self renderButtonsOn: html ]
			] 
		]
]

{ #category : #rendering }
AHAuthenticationComponent >> renderButtonsOn: html [
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
AHAuthenticationComponent >> renderContentOn: html [
	html modal
		id: 'authModalDialog';
		with: [ 
			html modalDialog with: [ 
				html modalContent: [ 
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]
]

{ #category : #rendering }
AHAuthenticationComponent >> renderHeaderOn: html [
	html modalHeader: [ 
		html modalTitle
			level5;
			style: 'color: black';
			with: 'Authentication'.
			html modalCloseButton. ]
]

{ #category : #rendering }
AHAuthenticationComponent >> renderPasswordFieldOn: html [
	html tbsFormGroup: [
	html label with: 'Password'.
	html passwordInput
		tbsFormControl;
		callback: [ :value | password := value ];
		value: password ]

]

{ #category : #accessing }
AHAuthenticationComponent >> validate [
	^ component tryConnectionWithLogin: self account andPassword: self password

]
