publishing
publishSuccess: aCIValidationResult 
	| change |
	
	change := aCIValidationResult change.
	
	change fixReviewed: aCIValidationResult asString in: SystemVersion current highestUpdate