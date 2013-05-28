instance creation
configuration
				
	^ self new
		addRule: 
			RBUnclassifiedMethodsRule harden & 
			RBNoClassCommentRule harden;
		yourself