publishing
publishSuccess: aCIValidationResult

	self stream
		nextPutAll: '<h2 style="color:green"><span class="glyphicon glyphicon-ok"></span> Success</h2>'.
	self publishSummary: aCIValidationResult.