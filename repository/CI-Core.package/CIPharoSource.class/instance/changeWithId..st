delegating issue tracker
changeWithId: anInteger
	^ self wrapIssue: (self tracker issueWithId: anInteger)