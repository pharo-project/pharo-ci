actions
verifyMerge: issue
	self 
		inform: 'Merging issue...' 
		during: [ 
			(Integration withConfig: self config)
				issues: { issue asIntegrationIssue };
				executeMerge ]