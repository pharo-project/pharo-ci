instance creation
pharo30
	^ self new
		addRule: 
			CIRunTestsRule & (
			
			RBUnclassifiedMethodsRule harden, 
			RBUndeclaredReferenceRule harden,
			RBNoClassCommentRule harden, 
			RBDefinesEqualNotHashRule harden,
			RBEquivalentSuperclassMethodsRule harden,
			RBJustSendsSuperRule harden,
			RBSubclassResponsibilityNotDefinedRule harden,
			RBTempVarOverridesInstVarRule harden,
			RBUndeclaredReferenceRule harden,
			RBVariableNotDefinedRule harden,
			RBEqualNotUsedRule harden,
			RBOnlyReadOrWrittenTemporaryRule harden,
			RBPrecedenceRule harden,
			RBSendsDeprecatedMethodToGlobalRule harden,
			RBSizeCheckRule harden,
			RBUnconditionalRecursionRule harden,
			RBUnoptimizedToDoRule harden,
			RBBetweenAndRule harden,
			RBCodeCruftLeftInMethodsRule harden,
						
			RBInstanceVariableCapitalizationRule, RBClassVariableCapitalizationRule,
			RBMissingSubclassResponsibilityRule,
			RBOverridesSpecialMessageRule,
			RBRefersToClassRule,
			RBBadMessageRule,
			RBUsesTrueRule,
			RBSendsDifferentSuperRule,
			RBInconsistentMethodClassificationRule, 
			RBInstVarInSubclassesRule,
			RBSentNotImplementedRule,
			RBLongMethodsRule,
			RBCollectionProtocolRule,
			RBConsistencyCheckRule,
			RBContainsRule, RBDetectContainsRule,
			RBEmptyExceptionHandlerRule,
			RBEndTrueFalseRule,
			RBEqualsTrueRule,
			RBExtraBlockRule,
			RBFileBlocksRule,
			RBFloatEqualityComparisonRule,
			RBLiteralArrayCharactersRule,
			RBMissingYourselfRule,
			RBModifiesCollectionRule,
			RBReturnsIfTrueRule,
			RBSearchingLiteralRule,
			RBUnnecessaryAssignmentRule,
			RBNotEliminationRule,
			
			RBAtIfAbsentRule,
			RBAllAnyNoneSatisfyRule,
			
			RBClassNameInSelectorRule );
		yourself