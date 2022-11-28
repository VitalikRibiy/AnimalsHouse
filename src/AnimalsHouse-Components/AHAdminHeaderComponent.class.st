Class {
	#name : #AHAdminHeaderComponent,
	#superclass : #AHHeaderComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHAdminHeaderComponent >> renderButtonsOn: html [

	html form
		style: 'margin-left: 1%';
		with: [ 
			self renderDisconnectButtonOn: html.
			self renderPublicViewButtonOn: html ]
]

{ #category : #rendering }
AHAdminHeaderComponent >> renderPublicViewButtonOn: html [


		html tbsNavbarButton
			tbsPullRight;
			style: self buttonStyle;
			callback: [ component goToMainView ];
			with: [ 
				html tbsGlyphIcon iconEyeOpen.
				html text: 'Публічний вигляд' ]
]
