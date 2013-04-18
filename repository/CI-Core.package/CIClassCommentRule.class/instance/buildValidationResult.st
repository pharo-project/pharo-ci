tests
buildValidationResult
	| result |
	result := CIValidationResult new.
	result 
		addAllWarnings: warnings;
		addAllFailures: errors.
	"result addAllMessages: messages."
	^ result