Class {
	#name : #AHAdminHeaderComponent,
	#superclass : #AHHeaderComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ 
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
AHAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
		tbsPullRight;
		callback: [ self session reset ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
AHAdminHeaderComponent >> renderPublicViewButtonOn: html [
	self session isLogged ifTrue: [ 
		html tbsNavbarButton 
			tbsPullRight;
			callback: [ component goToMainView ];
			with: [ 
				html tbsGlyphIcon iconEyeOpen.
				html text: 'Public View' ]
		]
]
