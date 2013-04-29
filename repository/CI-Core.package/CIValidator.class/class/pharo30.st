instance creation
pharo30
	^ self new
		addRule: "CIRunTestsRule &" CIClassCommentRule & CIUncategorizedMethodRule;
		yourself