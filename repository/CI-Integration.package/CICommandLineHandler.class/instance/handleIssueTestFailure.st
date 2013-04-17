action-test
handleIssueTestFailure 
	
	self stderr red: 'Issue ', issue id asString, ' has errors'.
	issue changeLoader buildRedReportOn: self stderr.
	self exitFailure. 