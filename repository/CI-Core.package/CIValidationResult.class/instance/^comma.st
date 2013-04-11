concatenation
, aCIValidationResult 
	self failures addAll: aCIValidationResult failures.
	self warnings addAll: aCIValidationResult warnings.
	self messages addAll: aCIValidationResult messages.