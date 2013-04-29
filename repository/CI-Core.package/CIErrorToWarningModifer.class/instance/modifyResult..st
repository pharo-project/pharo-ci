protocol
modifyResult: aCIValidationResult
	^ CIValidationResult new
		addAllWarnings: aCIValidationResult failures;
		addAllWarnings: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		result