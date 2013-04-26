as yet unclassified
loadConfiguration: aConfigurationName
	self inboxGofer
		package: aConfigurationName;
		load.
	^ Smalltalk globals at: aConfigurationName asSymbol