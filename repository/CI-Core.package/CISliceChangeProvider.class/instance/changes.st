delegating issue tracker
changes
	^ self tracker openIssues collect: [ :trackerIssue | 
			self wrapIssue: trackerIssue ]