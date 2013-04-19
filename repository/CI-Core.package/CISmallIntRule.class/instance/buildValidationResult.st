tests
buildValidationResult
	| result |
	result := CIValidationResult new.
	result 
		addAllFailures: errors;
		addAllMessages: messages.
	"result addAllMessages: messages."
	^ result