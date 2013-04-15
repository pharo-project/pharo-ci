action
loadIssue
	self inform: 'Loading issue ', change id asString.
	
	change load.
	Smalltalk saveAndQuit