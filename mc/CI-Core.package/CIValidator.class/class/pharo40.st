instance creation
pharo40
	^ self new
		addRule:
		(CISUnitTestsRule selectTestCaseBlock: [ :testCaseClass |
				(testCaseClass package name beginsWith: 'Metacello') not 
				and: [ testCaseClass ~= NBPointerArgumentsTests 
				and: [ testCaseClass ~=  ReleaseTest]]]),
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself