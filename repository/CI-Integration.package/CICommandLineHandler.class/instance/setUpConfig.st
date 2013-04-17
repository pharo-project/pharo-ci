setup
setUpConfig
	(self hasOption: 'url')
		ifTrue: [
			self stderr green: 'it will be load ConfigurationOf'; lf .
			issueChecker := CIConfigurationSource url: (self optionAt: 'url').
			(self hasOption: 'config')
				ifTrue: [ issue := issueChecker loadConfig: (self optionAt: 'config'). ]
				ifFalse: [ self stderr red: 'error: no config option has been found'; lf. ]
			]
		ifFalse: [ 
			self stderr red: 'error: no url has been found for ConfigurationOf'; lf.].