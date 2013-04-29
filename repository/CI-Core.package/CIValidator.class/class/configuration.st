instance creation
configuration
	^ self new
		addRule: CIRunConfigTestsRule & CIClassCommentRule & CIUncategorizedMethodRule;
		yourself