protocol
changeWithId: aVersionName
	"Returns a CIConfigurationChange for the given version using the default group.
	aVersion might be a numeric version such as: '1.0', '1.1' or as well a symbolic version name such as: #stable, #development, #last"
	^ CIConfigurationChange 
		source: self 
		configurationPoint: (self metacelloProject version: aVersionName)