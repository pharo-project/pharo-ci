instance creation
pharo30
	^ self new
		addRule: 
			(CISUnitTestsRule selectTestCaseBlock: [ :testCaseClass |
				(testCaseClass package name beginsWith: 'Metacello') not 
				and: [ testCaseClass ~= NBPointerArgumentsTests ]]),"
			CISUnitTestsRule,"
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself