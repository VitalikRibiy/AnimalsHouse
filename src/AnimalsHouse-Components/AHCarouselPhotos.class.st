Class {
	#name : #AHCarouselPhotos,
	#superclass : #SBSComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #accessing }
AHCarouselPhotos >> firstPhoto [
	^ 'https://img2.fonwall.ru/o/jo/cats-dogs-pets.jpg'
]

{ #category : #rendering }
AHCarouselPhotos >> renderContentOn: html [

	html carousel
		style: 'height: 80%; width: 50%;';
		id: 'example';
		slide;
		with: [ 
			html carouselInner with: [ 
					self renderImageOn: html with: self firstPhoto active: true.
					self renderImageOn: html with: self secondPhoto active: false.
					self renderImageOn: html with: self thirdPhoto active: false ].
			html carouselControlPreviousFor: 'example'.
			html carouselControlNextFor: 'example' ].
	html script: '$(".carousel").carousel()'
]

{ #category : #rendering }
AHCarouselPhotos >> renderImageOn: html with: url active: boolean [

	^ html carouselItem
		  style: 'display:flex; justify-content: center; background: white;';
		  class: 'active' if: boolean;
		  with: [ 
			  html tbsImage
				  style: 'width: auto; height: 300px;';
				  url: url ]
]

{ #category : #'as yet unclassified' }
AHCarouselPhotos >> secondPhoto [
	^ 'https://images.squarespace-cdn.com/content/v1/5c457bfbf2e6b156c933f36d/1579662986830-VWMHIVKDSCWR0KA0ICOZ/3+dogs+with+2+cats.jpg?format=1500w'
]

{ #category : #'as yet unclassified' }
AHCarouselPhotos >> thirdPhoto [
	^ 'https://www.wpri.com/wp-content/uploads/sites/23/2020/12/catsanddogs2.jpg?strip=1'
]
