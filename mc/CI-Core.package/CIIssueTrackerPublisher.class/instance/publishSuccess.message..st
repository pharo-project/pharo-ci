publishing
publishSuccess: aCIValidationResult message: aString
	| change |
	
	change := aCIValidationResult change.
	
	change 
		fixReviewed: aString
		in: SystemVersion current highestUpdate.