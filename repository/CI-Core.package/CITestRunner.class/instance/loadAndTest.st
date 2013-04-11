as yet unclassified
loadAndTest
	| arguments collectArguments |
	self halt.
	collectArguments := OrderedCollection new.
	collectArguments  
		add: 'config-test'; yourself;
		add: 'http://www.squeaksource.com/MetacelloRepository'; yourself;
		add: 'ConfigurationOf',self change project title ; yourself;
		add: '--install=last' ; yourself;
		add: '--test="',self change project title,'"' ; yourself.
		
	arguments := CommandLineArguments withArguments: collectArguments.
	BobNewCommandLineHandler activateWith: arguments.
	^ CIValidationResult failure: 'foo'
	"ici je dois mettre le checkerManifest par exemple"