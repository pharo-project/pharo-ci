instance creation
configuration
		
	"past one, new version is using SmallintRules :)
	^ self new
		addRule: CIClassCommentRule & CIUncategorizedMethodRule;
		yourself"
		
	^ self new
		addRule: 
			(RBUnclassifiedMethodsRule asCIValidationRule harden) & 
			(RBNoClassCommentRule asCIValidationRule harden);
		yourself