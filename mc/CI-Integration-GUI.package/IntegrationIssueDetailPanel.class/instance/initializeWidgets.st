initialization
initializeWidgets 
	self instantiateModels: #(
		tagLabel					LabelModel
		tagText					TextInputFieldModel
		configurationLabel		LabelModel
		configurationText 		TextInputFieldModel
		preloadLabel 			LabelModel
		preloadText 				TextModel 
		postloadLabel 			LabelModel
		postloadText 			TextModel).
					
	self tagLabel label: 'Tags'.
	self configurationLabel label: 'Configuration'.
	self preloadLabel label: 'Preload'.
	self postloadLabel label: 'Postload'.
	
	self tagText enabled: false.
	self configurationText enabled: false.	
	self preloadText enabled: false.
	self postloadText enabled: false