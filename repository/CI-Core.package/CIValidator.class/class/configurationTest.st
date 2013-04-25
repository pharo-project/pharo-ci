instance creation
configurationTest
	^ self new
		addRule: CIRunConfigTestsRule & CIClassCommentRule & CIUncategorizedMethodRule;
		yourself