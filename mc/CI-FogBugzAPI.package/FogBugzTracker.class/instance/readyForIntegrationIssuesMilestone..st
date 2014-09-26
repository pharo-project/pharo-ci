querying
readyForIntegrationIssuesMilestone: aString
	
	^ self getIssuesForQuery: '(status:"Resolved (Fix To Include)" OR status:"Resolved (Fix Reviewed by the Monkey)" OR status:"Resolved (Fix Review Needed)" AND milestone:"Pharo', aString, '")'