testing
runTests

	| suite result |
	
	suite := TestSuite new.
	
	testClasses do: [ :testClass|
		suite addTests: testClass suite tests ].
	
	suite := self removeCriticalTestsFrom: suite.
	
	"remove some tests which fail randomly under cog"
	suite := self removeCogCriticalTestsFrom: suite.

	self extraTests do: [ :testClass|
		suite addTests: testClass suite tests ].
	
	
	testStopwatch reset activate.
	result := suite run.
	testStopwatch suspend.
	
	^ result