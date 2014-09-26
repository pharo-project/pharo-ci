instance creation
fromIssue: anIssue 
	anIssue hasConfiguration 
		ifTrue: [ ^ IntegrationMetacello issue: anIssue ].
	^ IntegrationSlice issue: anIssue