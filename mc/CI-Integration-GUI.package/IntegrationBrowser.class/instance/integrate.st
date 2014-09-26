actions
integrate
	| integration issues |
	
	integration := Integration withConfig: self config.
	issues := self issueList selectedItems collect: #content.
	self
		inform: 'Performing integration...' 
		during: [ 
			integration 
				issues: (issues collect: #asIntegrationIssue);
				comment: self commentText text;
				preLoad: self preLoadText text;
				postLoad: self postLoadText text;
				execute ].
	integration isSuccess
		ifTrue: [ 
			self 
				showCloseDialogFor: issues
				integration: integration buildId ].
	self refreshAll