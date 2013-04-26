as yet unclassified
changeWithId: aConfigurationName
	^ CIConfigurationChange source: self configuration: (self loadConfiguration: aConfigurationName).