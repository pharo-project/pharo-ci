instance creation
configuration
	^ self new
		addRule: CIClassCommentRule & CIUncategorizedMethodRule;
		yourself