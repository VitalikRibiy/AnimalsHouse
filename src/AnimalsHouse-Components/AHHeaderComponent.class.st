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
			url: self application url;
			with: 'AnimalsHouse'.
		html tbsNavbarButton: 'SignIn' ].
]

{ #category : #rendering }
AHHeaderComponent >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ self renderAdminButtonOn: html ]
		ifFalse: [ self renderModalLoginButtonOn: html. ].
]

{ #category : #rendering }
AHHeaderComponent >> renderContentOn: html [
	| bar id |
	id := '#navbarCollapsed'.
	bar := html navigationBar.
	bar expandLarge;
		style: 'font: 15px Monserat; color: white; background-color: #355070'.
	bar with: [ 
		html navigationBarBrand: 'Animals House'.
		self renderButtonsOn: html.
		"The toggler that is only visible when reducing the width of screen"
		html
			navigationBarToggler
			beButtonType;
			collapse;
			dataTarget: id;
			with: [ html navigationBarTogglerIcon ].
	]
]

{ #category : #rendering }
AHHeaderComponent >> renderModalLoginButtonOn: html [
	html render: (AHAuthenticationComponent from: component).
	html tbsNavbarButton
		tbsPullRight;
		attributeAt: 'data-target' put: '#authModalDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [ 
			html tbsGlyphIcon iconLock.
			html text: 'Login' ]
]
