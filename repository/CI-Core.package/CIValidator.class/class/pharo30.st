instance creation
pharo30
	^ self new
		addRule: 
			(CIRunTestsRule selectTestCaseBlock: [ :testCase|
				testCase package name beginsWith: 'Kernel' ]),
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself