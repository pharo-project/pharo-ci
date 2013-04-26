initialize-release
initializeWithUrl: aUrl configurationName: aString
	super initialize.
	self url: aUrl.
	self loadConfiguration: aString