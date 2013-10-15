publishing
publishFailures: aCIValidationResult
	self 
		publishList: aCIValidationResult errors
		title: '<span class="label label-important">Errors and Failures</span>'