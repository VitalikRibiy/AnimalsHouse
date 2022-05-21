Class {
	#name : #AHAdminHeaderComponent,
	#superclass : #AHHeaderComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
AHAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
	tbsPullRight;
	callback: [ component goToMainView ];
	with: [
		html text: 'Disconnect '.
		html tbsGlyphIcon iconLogout ]
]
