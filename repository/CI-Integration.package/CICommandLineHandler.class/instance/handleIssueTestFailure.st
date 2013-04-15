action-test
handleIssueTestFailure 
	
	self stderr red: 'Issue ', change id asString, ' has errors'.
	change changeLoader buildRedReportOn: self stderr.
	self exitFailure. 