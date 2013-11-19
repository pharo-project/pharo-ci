helper parameters
publishTestParameters
	self flag: 'Should not need to copy down the complete method!'.
	
	self stream << '<table class="table table-condensed table-striped">'.
	self 
		publishImageVersion;
		publisOSVersion;
		publishVMVersion;
		publishJenkinsJobLink.
	self stream << '</table>'