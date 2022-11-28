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

{ #category : #'as yet unclassified' }
AHHeaderComponent >> buttonStyle [

	^ 'border-radius: 5px;height: 30px; width: fit-content;margin: 3px;'
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
			style: self buttonStyle;
			callback: [ component goToAdminView ];
			with: [ 
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' ] ]
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

	html container
		style: 'justify-content: flex-start; margin-left: 1%';
		with: [ 
			html form: [ 
					self renderHomeButtonOn: html.
					self renderTakenAnimalsButtonOn: html.
					self renderReviewsButtonOn: html ] ].
	html container
		style: 'justify-content: flex-end; margin-right: 7%';
		with: [ 
			self session isLogged
				ifTrue: [ 
					self session currentUser isAdministrator
						ifTrue: [ html form: [ self renderAdminButtonOn: html ] ]
						ifFalse: [ html form: [ self renderDisconnectButtonOn: html ] ] ]
				ifFalse: [ 
					html form: [ 
							self
								renderModalLoginButtonOn: html;
								renderModalRegisterButtonOn: html ] ] ]
]

{ #category : #rendering }
AHHeaderComponent >> renderContentOn: html [

	html navigationBar
		expandLarge;
		style:
			'width:100%; font: 65px Montserrat; color: white; background-color: #355070';
		with: [ 
			self renderBrandOn: html.
			self renderButtonsOn: html.
			html navigationBarToggler
				beButtonType;
				collapse;
				dataTarget: #navbarCollapsed;
				with: [ html navigationBarTogglerIcon ] ]
]

{ #category : #rendering }
AHHeaderComponent >> renderDisconnectButtonOn: html [

	html tbsNavbarButton
		tbsPullRight;
		style: self buttonStyle;
		callback: [ self session reset ];
		with: [ 
			html text: 'Вийти'.
			html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
AHHeaderComponent >> renderHomeButtonOn: html [

	html tbsNavbarButton tbsPullLeft
		style: self buttonStyle;
		callback: [ component goToMainView ];
		with: [ html text: 'Головна' ]
]

{ #category : #rendering }
AHHeaderComponent >> renderModalLoginButtonOn: html [

	html render: (AHAuthenticationModal from: component).
	html tbsNavbarButton
		tbsPullRight;
		style: self buttonStyle;
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
		style: self buttonStyle;
		attributeAt: 'data-target' put: '#registerModalDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [ 
			html tbsGlyphIcon iconLock.
			html text: 'Реєстрація' ]
]

{ #category : #rendering }
AHHeaderComponent >> renderReviewsButtonOn: html [

	html tbsNavbarButton tbsPullLeft
		style: self buttonStyle;
		disabled: component class = AHReviewsComponent;
		callback: [ component goToReviewsView ];
		with: [ html text: 'Відгуки' ]
]

{ #category : #rendering }
AHHeaderComponent >> renderTakenAnimalsButtonOn: html [

	html tbsNavbarButton tbsPullLeft
		style: self buttonStyle;
		disabled: component class = AHTakenAnimalsComponent;
		callback: [ component goToTakenAnimalsView ];
		with: [ html text: 'Забрані тварини' ]
]
