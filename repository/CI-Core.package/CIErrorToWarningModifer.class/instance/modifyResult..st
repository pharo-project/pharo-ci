protocol
modifyResult: aCIValidationResult
	^ CIValidationResult new
		addAllWarnings: aCIValidationResult errors;
		addAllWarnings: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		yourself