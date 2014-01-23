instance creation
buildIssuesFrom: string tracker: anIssueTracker
	| newIssues |
	newIssues := self buildIssuesFrom: string.
	newIssues do: [ :issue|
		issue tracker: anIssueTracker ].
	^ newIssues