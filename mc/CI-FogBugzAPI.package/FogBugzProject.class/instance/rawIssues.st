accessing
rawIssues

	^ rawIssues ifNil: [ self refreshRawIssues ]