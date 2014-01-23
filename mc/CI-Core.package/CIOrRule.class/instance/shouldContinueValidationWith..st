private
shouldContinueValidationWith: aCIValidationResult
	"As long as the intermediate result is a failure continue validating.
	Hence as soon as there is a positive result all the following rules are not validated."
	^ aCIValidationResult isFailure