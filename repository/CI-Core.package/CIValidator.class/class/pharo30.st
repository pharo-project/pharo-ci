instance creation
pharo30
	^ self new
		addRule: 
			(CISUnitTestsRule selectTestCaseBlock: [ :testCase|
				(testCase package name beginsWith: 'Metacello') not 
				and: [ testCase class ~= NBPointerArgumentsTests ]]),"
			CISUnitTestsRule,"
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself