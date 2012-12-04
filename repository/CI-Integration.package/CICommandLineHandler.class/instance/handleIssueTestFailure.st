action-test
handleIssueTestFailure 
	
	stderr red: 'Issue ', issue id asString, ' has errors'.
	issue changeLoader buildRedReportOn: stderr.
	self exitFailure. 