Class {
	#name : #AHReviewModal,
	#superclass : #AHBasicModal,
	#instVars : [
		'type',
		'text',
		'receiverUser',
		'sender'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHReviewModal >> receiverUser: receiverUserObject [

	receiverUser := receiverUserObject
]

{ #category : #rendering }
AHReviewModal >> renderContentOn: html [

	html modal
		id: 'ReviewModal';
		with: [ 
			html modalDialog with: [ 
					html
						modalContent: [ 
							self session isLogged ifTrue: [ 
									html modalHeader: [ 
											html modalTitle
												level5;
												with: 'Залиште свій відгук'.
											html modalCloseButton ].
									self renderFormBodyOn: html ]
						ifFalse: [ 
							html modalHeader: [ 
								html modalTitle
									level5;
									with: 'Доступно лише зареєстрованим користувачам'.
								html modalCloseButton ] ] ] ] ]
]

{ #category : #rendering }
AHReviewModal >> renderFormBodyOn: html [

	html modalBody: [ 
		html form
			style:
				'color: black; font-size: medium; display: flex; flex-direction: column';
			multipart;
			with: [ 
				html formGroup with: [ 
						html label: 'Ваше враження:'.
						html select
							list: ReviewType list;
							callback: [ :value | type := value ] ].
				html formGroup with: [ 
					html label: 'Відгук:'.
					html textInput
						formControl;
						callback: [ :value | text := value ] ].
				html modalFooter: [ 
					html tbsButton
						beDefault;
						dataDismiss: 'modal';
						callback: [ self reset ];
						with: 'Закрити'.
					html tbsSubmitButton
						bePrimary;
						callback: [ self save ];
						with: 'Надіслати відгук' ] ] ]
]

{ #category : #initialization }
AHReviewModal >> reset [

	type := ReviewType positive.
	text := nil.
]

{ #category : #actions }
AHReviewModal >> save [

	AHReview
		withText: text
		receiver: receiverUser
		sender: sender
		type: type
]

{ #category : #accessing }
AHReviewModal >> sender: senderUser [
	
	sender := senderUser 
]
