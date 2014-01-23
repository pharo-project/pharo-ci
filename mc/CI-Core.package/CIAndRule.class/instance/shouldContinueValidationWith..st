private
shouldContinueValidationWith: aCIValidationResult
	"Validate rules for as long as they succeed. Hence all rules after a failing result are ignored."
	^ aCIValidationResult isSuccess