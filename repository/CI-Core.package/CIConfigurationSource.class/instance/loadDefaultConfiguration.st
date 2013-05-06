private
loadDefaultConfiguration
	"Try to find a valid configuration in a repository
	1. use the repository name to deduce a valid configuration name
	2. or check all packages in the repository and use the single package starting with ConfigurationOf.."
	(self url asZnUrl lastPathSegment beginsWith: 'ConfigurationOf')
		ifTrue: [ ^ self loadConfiguration: (self url asZnUrl lastPathSegment) ].
	(self listConfigurations size = 1)
		ifFalse: [ ^ Error signal: 'The specified url does not contain a ConfigurationOf'  ].
	self loadConfiguration: (self listConfigurations at: 1).