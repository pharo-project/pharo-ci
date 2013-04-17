as yet unclassified
source: aCISource configuration: aConfigurationName
	^ (self source: aCISource) 
		loadConfiguration: aConfigurationName;
		url: aCISource inboxUrl;
		yourself.