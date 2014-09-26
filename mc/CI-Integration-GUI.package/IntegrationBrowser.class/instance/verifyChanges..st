actions
verifyChanges: issue
	self 
		inform: 'Verifying issue changes...' 
		during: [ 
			(Integration withConfig: self config)
				issues: { issue asIntegrationIssue };
				executeChanges ]