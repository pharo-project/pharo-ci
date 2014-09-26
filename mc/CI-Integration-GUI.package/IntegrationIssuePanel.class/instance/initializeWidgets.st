initialization
initializeWidgets 
	self instantiateModels: #(
		detailPanel 		IntegrationIssueDetailPanel
		eventPanel 		IntegrationIssueEventBrowser).
	
	self detailPanel issue: self issue.
	self eventPanel issue: self issue.
	
	self focusOrder 
		add: self eventPanel;
		add: self detailPanel