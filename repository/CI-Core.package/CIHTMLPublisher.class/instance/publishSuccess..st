publishing
publishSuccess: aCIValidationResult

	self stream
		nextPutAll: '<h2>'; 
		nextPutAll: aCIValidationResult change name asString;
		nextPutAll: ' test succeed</h2>'.