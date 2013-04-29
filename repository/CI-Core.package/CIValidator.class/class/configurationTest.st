instance creation
configurationTest
	^ self new
		addRule: CIClassCommentRule & CIUncategorizedMethodRule;
		yourself