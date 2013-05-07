tests
exampleVersionGroup
	| collection arguments  |
	collection := OrderedCollection new.
	collection add: 'config'.
	collection add: 'http://smalltalkhub.com/mc/PharoExtras/Pastell/main'.	
	collection add: 'ConfigurationOfPastell'.
	collection add: '--version=1.3'.
	"collection add: '--version=1.2'. should not work because there is no Tests package in 1.2"
	collection add: '--group=Tests'.

	arguments := CommandLineArguments withArguments: collection.
	CICommandLineHandler activateWith: arguments.