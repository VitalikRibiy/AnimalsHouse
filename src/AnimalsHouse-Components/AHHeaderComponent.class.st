Class {
	#name : #AHHeaderComponent,
	#superclass : #SBSComponent,
	#category : #'AnimalsHouse-Components'
}

{ #category : #rendering }
AHHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ 
		html tbsNavbarBrand
			url: self application url;
			with: 'AnimalsHouse'.
		html tbsNavbarButton: 'SignIn'].
]

{ #category : #rendering }
AHHeaderComponent >> renderContentOn: html [
	| bar id|
	id := '#navbarCollapsed'.
	bar := html navigationBar.
	bar expandLarge; 
		style: 'font: 15px Monserat; color: white; background-color: #355070'.
	bar with: [ 
		html navigationBarBrand: 'Animals House'.
		
		"The toggler that is only visible when reducing the width of screen"
		html
			navigationBarToggler
			beButtonType;
			collapse;
			dataTarget: id;
			with: [ html navigationBarTogglerIcon ].
				
		html navigationBarCollapse collapse id: 'navbarCollapsed'; with: [ 
			html navigationBarNavigation: [
				html navigationItem 
					
					dropdown with: [ 
					html navigationLink dropdownToggle; dataToggle: 'dropdown'; with: 'Взяти тварину'.
				 
					html dropdownMenu 
						attributeAt: 'aria-labelledby' put: 'navbarDropdown';
						with: [ 
						html dropdownItem: 'Actions'.
						html dropdownItem: 'Another action'.
						html dropdownDivider.
						html dropdownItem: 'Something else here'.
					 ]
				].
			].
		]
	]
]
