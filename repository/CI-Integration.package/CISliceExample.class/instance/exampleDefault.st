tests
exampleDefault
	| collection arguments  |
	collection := OrderedCollection new.
	collection add: 'ci'.
	collection add: 'slice'.	
	collection add: 'test'.
	collection add: '--issue=10661'.
	
	arguments := CommandLineArguments withArguments: collection.
	CICommandLineHandler activateWith: arguments.