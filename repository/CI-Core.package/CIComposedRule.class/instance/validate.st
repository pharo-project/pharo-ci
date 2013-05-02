protocol
validate
	| result |
	result := CIValidationResult new.
	
	self rules do: [ :validationRule |
		result := result, (validationRule validate).
		(self shouldContinueValidationWith: result)
			ifFalse: [ ^ self validationResult: result ]].
	^ self validationResult: result.
	