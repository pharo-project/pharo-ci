publishing
publishSuccess: aCIValidationResult

	self stream nextPutAll: '<h1>', aCIValidationResult change name asString, ' test succeed ! </h1>'.