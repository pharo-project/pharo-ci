publishing
publishFailure: aCIValidationResult

	self stream
		nextPutAll: '<h2 style="color:red"><span class="glyphicon glyphicon-remove"></span> Failure</h2>'.
	
	self publishFailures: aCIValidationResult