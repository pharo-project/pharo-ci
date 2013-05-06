initialize-release
initializeWithUrl: aUrl
	super initialize.
	self url: aUrl.
	self metacelloProject: (self loadDefaultConfiguration) project