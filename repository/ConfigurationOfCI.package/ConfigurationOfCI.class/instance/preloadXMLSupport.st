preload
preloadXMLSupport

	Gofer new
		squeaksource: 'XMLSupport';
		package: 'ConfigurationOfXMLSupport';
		load.
		
	(Smalltalk at: #ConfigurationOfXMLSupport) perform: #loadDefault
		
	