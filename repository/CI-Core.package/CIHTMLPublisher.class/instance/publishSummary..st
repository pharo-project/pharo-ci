helper summary
publishSummary: aValidationResult
	
	self publishSummaryLabels: aValidationResult.
	self stream << '<h2>Validation Setup</h2>'.
	self publishTestParameters: aValidationResult.