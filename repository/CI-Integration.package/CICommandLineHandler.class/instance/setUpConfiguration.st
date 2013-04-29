setup
setUpConfiguration
	(self hasOption: 'url')
		ifFalse: [ ^ self exitFailure: 'error: no url has been found for ConfigurationOf' ].
		
	issueChecker :=  CIChangeManager 
			source: (CIConfigurationSource url: (self optionAt: 'url')) 
			validator: CIValidator configuration.
		
	(self hasOption: 'config')
		ifFalse: [ ^ self exitFailure: 'error: no config option has been found' ].
		
	issue := issueChecker changeWithId: (self optionAt: 'config').