setup
setHtmlResourcesFor: publisher
	
	(self hasOption: 'html-resources')
		ifTrue: [ publisher htmlResourcesUrl: (self optionAt: 'html-resources') ]