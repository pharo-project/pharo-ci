delegating issue tracker
nextIssueToBeChecked
	^ self wrapIssue: (self tracker nextIssueToBeChecked)