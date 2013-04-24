publishing
publishValidationResult: aCIValidationResult
	
	self publishers do: [ :aPublisher | (aPublisher manager: self manager) publishValidationResult: aCIValidationResult ].
	