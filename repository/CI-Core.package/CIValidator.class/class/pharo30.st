instance creation
pharo30
	^ self new
		addRule: 
			(CISUnitTestsRule selectTestCaseBlock: [ :testCase|
				(testCase package name beginsWith: 'Metacello') not ]),"
			CISUnitTestsRule,"
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself