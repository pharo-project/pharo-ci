as yet unclassified
testExample
	| collection arguments command |
	collection := OrderedCollection new.
	collection add: 'config'.
	collection add: '--url=http://smalltalkhub.com/mc/PharoExtras/Soup/main'.	
	collection add: '--config=ConfigurationOfSoup'.

	arguments := CommandLineArguments withArguments: collection.
	command := CICommandLineHandler activateWith: arguments.