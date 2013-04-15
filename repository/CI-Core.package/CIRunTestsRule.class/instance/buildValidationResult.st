tests
buildValidationResult
	| result |
	result := CIValidationResult new.
	result 
		addAllFailures: errors;
		addAllFailures: testFailures;
		addAllFailures: testErrors.
	"result addAllMessages: messages."
	^ result