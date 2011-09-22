testing
runTests

	| suite |
	
	suite := TestSuite new.
	
	testClasses do: [ :testClass|
		suite addTests: testClass suite tests ].

	self dirtyPackagesTests do: [ :testClass|
		suite addTests: testClass suite tests ].

	^ suite run.