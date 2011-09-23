testing
runTests

	| suite result |
	
	suite := TestSuite new.
	
	testClasses do: [ :testClass|
		suite addTests: testClass suite tests ].

	self extraTests do: [ :testClass|
		suite addTests: testClass suite tests ].

	testStopwatch reset activate.
	result := suite run.
	testStopwatch suspend.
	^ result