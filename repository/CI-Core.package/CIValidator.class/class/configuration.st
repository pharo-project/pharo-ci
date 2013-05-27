instance creation
configuration
				
	^ self new
		addRule: 
			CIChangeValidationRule, 
			RBUnclassifiedMethodsRule harden & 
			RBNoClassCommentRule harden;
		yourself