*CI-Core-Validation
pharoSoftLintRules	
	^ self rules: ({			
		RBInstanceVariableCapitalizationRule.
		RBClassVariableCapitalizationRule.
		RBMissingSubclassResponsibilityRule.
		RBOverridesSpecialMessageRule.
		RBRefersToClassRule.
		RBBadMessageRule.
		RBUsesTrueRule.
		RBSendsDifferentSuperRule.
		RBInconsistentMethodClassificationRule. 
		RBInstVarInSubclassesRule.
		RBSentNotImplementedRule.
		RBLongMethodsRule.
		RBCollectionProtocolRule.
		RBConsistencyCheckRule.
		RBContainsRule. RBDetectContainsRule.
		RBEmptyExceptionHandlerRule.
		RBEndTrueFalseRule.
		RBEqualsTrueRule.
		RBExtraBlockRule.
		RBFileBlocksRule.
		RBFloatEqualityComparisonRule.
		RBLiteralArrayCharactersRule.
		RBMissingYourselfRule.
		RBModifiesCollectionRule.
		RBReturnsIfTrueRule.
		RBSearchingLiteralRule.
		RBUnnecessaryAssignmentRule.
		RBNotEliminationRule.
		RBAtIfAbsentRule.
		"RBAllAnyNoneSatisfyRule."
		RBClassNameInSelectorRule 
	} collect: [ :each | each new ])