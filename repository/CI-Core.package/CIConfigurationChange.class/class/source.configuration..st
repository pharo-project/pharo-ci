as yet unclassified
source: aCISource configuration: aConfigurationName
	self flag: 'TODO: Change aConfigurationName to aConfigCommandLineHandler, supporting --group --version ..'.
	^ (self source: aCISource) 
		loadConfiguration: aConfigurationName;
		url: aCISource inboxUrl;
		yourself.