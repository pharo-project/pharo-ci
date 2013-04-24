setup
setUpConfig
	(self hasOption: 'url')
		ifTrue: [
			self stderr green: 'it will be load ConfigurationOf'; lf .
			issueChecker :=  CIChangeManager source: (CIConfigurationSource url: (self optionAt: 'url')) validator: CIValidator configurationTest  .
			(self hasOption: 'config')
				ifTrue: [ issue := issueChecker source loadConfig: (self optionAt: 'config'). ]
				ifFalse: [ self stderr red: 'error: no config option has been found'; lf. ]
			]
		ifFalse: [ 
			self stderr red: 'error: no url has been found for ConfigurationOf'; lf.].