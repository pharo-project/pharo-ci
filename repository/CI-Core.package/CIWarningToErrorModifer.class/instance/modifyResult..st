protocol
modifyResult: aCIValidationResult
	^ CIValidationResult new
		addAllFailures: aCIValidationResult failures;
		addAllFailures: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		yourself