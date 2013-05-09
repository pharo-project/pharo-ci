protocol
modifyResult: aCIValidationResult
	^ CIValidationResult new
		addAllErrors: aCIValidationResult errors;
		addAllErrors: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		yourself