test-report
buildValidationResult
	| result |
	result := CIValidationResult new.
	result 
		addAllWarnings: warnings;
		addAllFailures: errors;
		addAllMessages: messages.
	^ result