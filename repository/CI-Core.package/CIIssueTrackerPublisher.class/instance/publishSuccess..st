publishing
publishSuccess: aCIValidationResult 
	| change |
	
	change := aCIValidationResult change.
	
	change 
		fixReviewed: aCIValidationResult htmlString 
		in: SystemVersion current highestUpdate