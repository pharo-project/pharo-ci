instance creation
pharo30
	^ self new
		addRule: RBUndeclaredReferenceRule;
		"	(CISUnitTestsRule selectTestCaseBlock: [ :testCaseClass |
				(testCaseClass package name beginsWith: 'Metacello') not 
				and: [ testCaseClass ~= NBPointerArgumentsTests ]]),
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;"
			
		yourself