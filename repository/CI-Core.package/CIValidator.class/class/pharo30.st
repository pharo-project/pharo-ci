instance creation
pharo30
	^ self new
		addRule: 
			CIRunTestsRule,
			RBCompositeLintRule pharoHardLintRules harden,
			RBCompositeLintRule pharoSoftLintRules;
		yourself