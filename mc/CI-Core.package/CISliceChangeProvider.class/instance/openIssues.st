delegating issue tracker
openIssues
	^ self tracker openIssues collect: [ :trackerIssue | 
			self wrapIssue: trackerIssue ]