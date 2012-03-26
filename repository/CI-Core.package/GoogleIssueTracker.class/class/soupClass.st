to be overriden
soupClass
	" the core does not include Soup, hence we propose to load it here"
	self error: 'Soup is not installed. Proceed to install...'.
	
	ConfigurationOfContinousIntegration project currentVersion loadVersion: #soup