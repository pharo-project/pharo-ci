initialize-release
initializeWithUrl: aUrl configurationName: aString
	super initialize.
	self url: aUrl.
	self metacelloProject: (self loadConfiguration: aString) project