issues
nextIssueId
	
	^ self nextIssueToBeChecked 
			ifNil: [ nil ] 
			ifNotNil:[ :nextIssue | nextIssue id ]