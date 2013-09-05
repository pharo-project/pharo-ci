*CI-Core-Validation
pharoHardLintRules
	^ self rules: ({ 
		RBUndeclaredReferenceRule.
		RBUnclassifiedMethodsRule.
		RBNoClassCommentRule. 
		RBDefinesEqualNotHashRule.
		RBEquivalentSuperclassMethodsRule.
		RBJustSendsSuperRule.
		RBSubclassResponsibilityNotDefinedRule.
		RBTempVarOverridesInstVarRule.
		RBVariableNotDefinedRule.
		RBEqualNotUsedRule.
		RBOnlyReadOrWrittenTemporaryRule.
		RBPrecedenceRule.
		RBSendsDeprecatedMethodToGlobalRule.
		RBSizeCheckRule.
		RBUnconditionalRecursionRule.
		RBUnoptimizedToDoRule.
		RBBetweenAndRule.
		RBCodeCruftLeftInMethodsRule 
	} collect: [ :each | each new ])