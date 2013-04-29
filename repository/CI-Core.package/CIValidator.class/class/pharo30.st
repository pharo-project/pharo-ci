instance creation
pharo30
	^ self new
		addRule: CIRunTestsRule & CIClassCommentRule harden & CIUncategorizedMethodRule;
		yourself