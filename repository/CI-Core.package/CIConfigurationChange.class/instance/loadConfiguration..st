accessing
loadConfiguration: aConfigurationName
	^ self configuration: (self source loadConfigFor: aConfigurationName)