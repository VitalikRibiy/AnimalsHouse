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
	html carousel 
		id: 'example';
		slide; with:[ 
		html carouselInner: [
			html carouselItem active with: [ html html: SBSCardExample imagePlaceHolderSVG ].
			html carouselItem with: [ 
				html html: SBSCardExample imagePlaceHolderSVG
				 ].					
		].		
		html carouselControlPreviousFor: 'example'.	
		html carouselControlNextFor: 'example'. 	
	].
	html script: '$(".carousel").carousel()'
]
