helper parameters
publishTestParameters: aValidationResult
	self stream << '<table class="table table-condensed table-striped">'.
	self 
		publishImageVersion;
		publisOSVersion;
		publishVMVersion;
		publishChangeVersion: aValidationResult;
		publishAdditionalParameters.
	self stream << '</table>'