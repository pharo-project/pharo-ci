initialization
initializeWidgets 
	self instantiateModels: #(
		refreshButton		ButtonModel
		configureButton		ButtonModel
		integrateButton 	ButtonModel).
			
	refreshButton
		icon: Smalltalk ui icons smallUpdateIcon;
		label: 'Refresh'.
	configureButton 
		icon: Smalltalk ui icons configurationIcon;
		label: 'Configure'.
	integrateButton 
		icon: Smalltalk ui icons smallOkIcon;
		label: 'Go!'	