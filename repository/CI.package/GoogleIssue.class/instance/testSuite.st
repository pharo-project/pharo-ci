private
testSuite	
	| suite|
	suite := TestSuite named: self title.
	
	suite addTests: self coreTests.
	
	self relatedTests do: [ :testCase|
		suite addTests: testCase suite tests ].
	
	^ suite