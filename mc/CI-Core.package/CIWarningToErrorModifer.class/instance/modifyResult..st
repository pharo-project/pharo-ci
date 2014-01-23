protocol
modifyResult: aCIValidationResult
	| result |
	result := CIValidationResult new
		addAllErrors: aCIValidationResult errors;
		addAllErrors: aCIValidationResult warnings;
		addAllMessages: aCIValidationResult messages;
		yourself.
	^ self validationResult: result