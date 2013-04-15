action
fetchIssue
	| issueNumber |
	
	issueNumber := self optionAt: 'issue' ifAbsent: [
		^ self fetchNextIssue ].
	
	change := self issueChecker changeWithId: issueNumber.