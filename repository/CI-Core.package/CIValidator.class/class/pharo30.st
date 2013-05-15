instance creation
pharo30

"past one, new version is using SmallintRules :)
	^ self new
		addRule: CIRunTestsRule & CIClassCommentRule harden & CIUncategorizedMethodRule harden;
		yourself"
		
	^ self new
		addRule: 
			CIRunTestsRule & 
			(RBUnclassifiedMethodsRule asCIValidationRule harden) & 
			(RBNoClassCommentRule asCIValidationRule harden);
		yourself