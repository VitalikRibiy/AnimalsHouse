Class {
	#name : #AHReviewsComponent,
	#superclass : #AHScreenComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #'as yet unclassified' }
AHReviewsComponent >> goToAdminView [

	self call: AHAdminComponent new
]

{ #category : #'as yet unclassified' }
AHReviewsComponent >> goToMainView [

	self answer.
]

{ #category : #'as yet unclassified' }
AHReviewsComponent >> goToReviewsView [

	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
AHReviewsComponent >> goToTakenAnimalsView [

	self call: AHTakenAnimalsComponent new.
]

{ #category : #rendering }
AHReviewsComponent >> renderMainContentOn: html [

	html column
		style: 'min-height: 86vh;';
		extraLargeSize: 10;
		extraLargeOffset: 1;
		mediumSize: 8;
		mediumOffset: 2;
		with: [ 
			self renderLoginErrorMessageIfAnyOn: html.
			html row
				style: 'justify-content: start; height: 6vh; margin: 5px';
				with: [ 
					html formButton bePrimary
						style: 'height: 4vh; font-size: 16px; border-radius: 10px';
						dataToggle: 'modal';
						dataTarget: '#ReviewModal';
						with: 'Залишити відгук' ].
			html div
				style:
					'height: 80vh; overflow-x: hidden; overflow-y: auto; border: 3px solid #355070; border-radius: 12px; padding: 5px';
				with: [ self renderReviewsOn: html ].
			html row: ((AHReviewModal from: self)
					 sender: self session currentUser;
					 receiverUser: AHAdministrator getInstance) ]
]

{ #category : #rendering }
AHReviewsComponent >> renderReview: review on: html [

	html row with: [ 
		html tbsPanel
			style: 'width: 100%';
			class: 'panel-danger' if: review type = ReviewType negative;
			class: 'panel-success' if: review type = ReviewType positive;
			with: [ 
				html tbsPanelHeading: [ 
						html tbsPanelTitle
							level: 3;
							with: review sender userInfo firstName , ' '
								, review sender userInfo lastName , '-'
								, review date asDate asString ].
				html horizontalRule.
				html tbsPanelBody: review text ] ]
]

{ #category : #rendering }
AHReviewsComponent >> renderReviewsOn: html [

	^ ((AHReview selectAll select: [ :review | 
		    review receiverUser isAdministrator ]) sort: [ :a :b | 
		   a date > b date ]) collect: [ :filteredReview | 
		  self renderReview: filteredReview on: html ]
]
