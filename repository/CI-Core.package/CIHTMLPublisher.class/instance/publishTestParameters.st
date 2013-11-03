helper parameters
publishTestParameters
	self stream << '<table class="table table-condensed table-striped">'.
	self publishImageVersion.
	self publisOSVersion.
	self publishVMVersion.
	self stream << '</table>'