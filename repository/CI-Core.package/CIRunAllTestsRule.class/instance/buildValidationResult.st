tests
buildValidationResult
	| result |
	result := CIValidationResult new.
	result addAllFailures: errors.
	result addAllFailures: testErrors.
	result addAllFailures: testFailures.
	^ result