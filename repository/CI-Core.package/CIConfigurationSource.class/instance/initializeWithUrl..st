initialize-release
initializeWithUrl: aUrl
	super initialize.
	self url: aUrl.
	self loadDefaultConfiguration.