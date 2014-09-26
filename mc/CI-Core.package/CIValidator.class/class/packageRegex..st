instance creation
packageRegex: aRegex
	^ self new
		addRule:
		(CISUnitTestsRule packageRegex: aRegex),
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself