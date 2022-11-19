Class {
	#name : #AHHeaderComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'component'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #'instance creation' }
AHHeaderComponent class >> from: aComponent [
	^ self new
	 component: aComponent;
	yourself
]

{ #category : #accessing }
AHHeaderComponent >> component [

	^ component
]

{ #category : #accessing }
AHHeaderComponent >> component: anObject [

	component := anObject
]

{ #category : #rendering }
AHHeaderComponent >> renderAdminButtonOn: html [
	html form: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToAdministrationView ];
			with: [
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' 
				]
			]

]

{ #category : #rendering }
AHHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ 
		html tbsNavbarBrand
			style: 'font-size: large; 
				color: white; 
    			padding: 15px;
    			text-align: center;';
			url: self application url;
			with: 'Дім Тварин' ].
]

{ #category : #rendering }
AHHeaderComponent >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ 
			self session currentUser isAdministrator 
				ifTrue: [ html form: [ self renderAdminButtonOn: html ].  ]
				ifFalse:	[ html form: [ self renderDisconnectButtonOn: html ]. ]
			 ]
		ifFalse: [ html form: [ self renderModalLoginButtonOn: html; renderModalRegisterButtonOn: html ]. ].
]

{ #category : #rendering }
AHHeaderComponent >> renderContentOn: html [
	| bar id |
	id := '#navbarCollapsed'.
	bar := html navigationBar.
	bar expandLarge;
		style: 'font: 65px Montserrat; color: white; background-color: #355070';
		with: [ 
			self renderBrandOn: html.
			self renderButtonsOn: html.
			"The toggler that is only visible when reducing the width of screen"
			html
				navigationBarToggler
				beButtonType;
				collapse;
				dataTarget: id;
				with: [ html navigationBarTogglerIcon ].
		].
]

{ #category : #rendering }
AHHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
		tbsPullRight;
		callback: [ self session reset ];
		with: [
			html text: 'Вийти'.
			html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
AHHeaderComponent >> renderModalLoginButtonOn: html [
	html render: (AHAuthenticationModal from: component).
	html tbsNavbarButton
		tbsPullRight;
		attributeAt: 'data-target' put: '#authModalDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [ 
			html tbsGlyphIcon iconLock.
			html text: 'Залогуватись' ]
]

{ #category : #rendering }
AHHeaderComponent >> renderModalRegisterButtonOn: html [
	html render: (AHRegisterComponent from: component).
	html tbsNavbarButton
		tbsPullRight;
		attributeAt: 'data-target' put: '#registerModalDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [ 
			html tbsGlyphIcon iconLock.
			html text: 'Реєстрація' ]
]
