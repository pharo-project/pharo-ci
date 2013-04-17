as yet unclassified
loadConfigFor: aConfigurationName
	self inboxGofer
		package: aConfigurationName;
		load.
	^ Smalltalk globals at: aConfigurationName asSymbol