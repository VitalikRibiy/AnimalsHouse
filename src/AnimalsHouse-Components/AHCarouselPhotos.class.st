Class {
	#name : #AHCarouselPhotos,
	#superclass : #SBSComponent,
	#instVars : [
		'animals'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHCarouselPhotos >> animals: anObject [

	animals := Animal selectAll.
]

{ #category : #rendering }
AHCarouselPhotos >> renderContentOn: html [
	|id|
	id := '#carousel-example-generic'.
	html div style: 'width: 900px; height: 500px;'; with: [ 
	html tbsCarousel id: id; slide; with: [ 
		html tbsCarouselIndicators: [
			html listItem
				attributeAt: 'data-target' put: id;
				attributeAt: 'data-slide-to' put: 0;
				class: 'active'.
			html listItem
				attributeAt: 'data-target' put: id;
				attributeAt: 'data-slide-to' put: 1.
			html listItem
				attributeAt: 'data-target' put: id;
				attributeAt: 'data-slide-to' put: 2.
			  ].
		html tbsCarouselInner: [ 
			html div class: 'item active'; 
				with: [ html html: SBSCardExample imagePlaceHolderSVG.
					    html tbsCarouselCaption: [ html heading level: 3; with: 'First slide label'. 
											     html paragraph: 'Nulla vitae elit libero, a pharetra augue mollis interdum.' ] ].
			html div class: 'item'; with: [ html html: SBSCardExample imagePlaceHolderSVG ].
			html div class: 'item'; with: [ html html: SBSCardExample imagePlaceHolderSVG ].
		 ].
		html tbsCarouselControlLeftFor: id.
		html tbsCarouselControlRightFor: id.
	]].
]
