tests
runAllTests
	
	|suite|
	
	suite := TestSuite new.
	
	TestCase allSubclasses do: [ :testClass|
		testClass isAbstract ifFalse: [ suite addTests: testClass suite tests ]].
	
	^ suite run.