issues
nextIssueId
	
	^ self nextIssue 
			ifNil: [ nil ] 
			ifNotNil:[ :nextIssue | nextIssue id ]