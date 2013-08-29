instance creation
pharo30
	^ self new
		addRule: 
			"(CIRunTestsRule selectTestCaseBlock: [ :testCase|
				testCase package name beginsWith: 'Kernel' ]),"
			CIRunTestsRule,
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself