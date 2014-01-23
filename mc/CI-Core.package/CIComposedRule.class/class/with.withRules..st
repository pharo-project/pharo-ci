instance creation
with: aCIValidationRule withRules: anotherCIValidationRule
	^ self new
		add: aCIValidationRule;
		addAll: anotherCIValidationRule;
		yourself