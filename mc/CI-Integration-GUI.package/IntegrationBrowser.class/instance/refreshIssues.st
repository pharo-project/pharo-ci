actions
refreshIssues
	self 
		inform: 'Refreshing integrable issues...' 
		during: [ issueList roots: (self manager readyForIntegrationIssuesMilestone: self config version) ]