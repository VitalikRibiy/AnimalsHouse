Class {
	#name : #AHCarouselPhotos,
	#superclass : #SBSComponent,
	#instVars : [
		'animals'
	],
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHCarouselPhotos >> firstPhoto [
	^ 'https://img2.fonwall.ru/o/jo/cats-dogs-pets.jpg'
]

{ #category : #rendering }
AHCarouselPhotos >> renderContentOn: html [
	html carousel 
		id: 'example';
		slide; with:[ 
		html carouselInner: [
			html carouselItem active with: [ html tbsImage style: 'height: 100%; width: 100%; max-height: 650px'; url: self firstPhoto ].
			html carouselItem with: [ 
				html tbsImage style: 'height: 100%; width: 100%; max-height: 650px'; url: self secondPhoto.
				 ].	
			html carouselItem with: [ 
				html tbsImage style: 'height: 100%; width: 100%; max-height: 650px'; url: self thirdPhoto.
				 ].					
		].		
		html carouselControlPreviousFor: 'example'.	
		html carouselControlNextFor: 'example'. 	
	].
	html script: '$(".carousel").carousel()'
]

{ #category : #'as yet unclassified' }
AHCarouselPhotos >> secondPhoto [
	^ 'https://images.squarespace-cdn.com/content/v1/5c457bfbf2e6b156c933f36d/1579662986830-VWMHIVKDSCWR0KA0ICOZ/3+dogs+with+2+cats.jpg?format=1500w'
]

{ #category : #'as yet unclassified' }
AHCarouselPhotos >> thirdPhoto [
	^ 'https://www.wpri.com/wp-content/uploads/sites/23/2020/12/catsanddogs2.jpg?strip=1'
]
