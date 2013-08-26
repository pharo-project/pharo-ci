private
loadConfiguration: aConfigurationName
	self gofer
		package: aConfigurationName;
		load.
	^ Smalltalk globals at: aConfigurationName asSymbol