publishing
publishChangeNotFound: aCIValidationResult
	
	self publishers do: [ :publisher | 
			publisher publishChangeNotFound: aCIValidationResult ].
	