to be overriden
soupClass
	" the core does not include Soup, hence we propose to load it here"
	
	^ (Smalltalk classNamed: #Soup)
		ifNil: [self error: 'Soup is not installed. Proceed to install...'.
			(ConfigurationOfCI project version: #stable) load: 'soup']
		ifNotNil: [:cl | cl]