protocol
modifyResult: aCIValidationResult
	| result |
	result := CIValidationResult new
		addAllWarnings: aCIValidationResult errors;
		addAllWarnings: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		yourself.
	^ self validationResult: result.