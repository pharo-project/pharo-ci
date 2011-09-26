tests
runTests
	
	| extraClasses suite result |
	extraClasses := issuesToIntegrate gather: [:issue | issue testClassesToBeChecked ].
	
	suite := TestSuite new.
	
	self testClasses do: [ :testClass|
		suite addTests: testClass suite tests ].
	
	suite := self removeCriticalTestsFrom: suite.
	
	extraClasses do: [ :testClass|
		suite addTests: testClass suite tests ].
	
	result := suite run.
	
	^ result