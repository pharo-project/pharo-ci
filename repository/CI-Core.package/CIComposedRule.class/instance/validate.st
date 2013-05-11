protocol
validate
	| result |
	result := CIValidationResult new.
	
	self rules do: [ :validationRule |
		result := result, (validationRule validate: self change).
		(self shouldContinueValidationWith: result)
			ifFalse: [ ^ self addValidationResult: result ]].
	
	^  self addValidationResult: result.
	