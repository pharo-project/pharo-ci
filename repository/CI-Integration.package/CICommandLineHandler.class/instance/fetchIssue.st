action
fetchIssue
	| issueNumber |
	
	issueNumber := self optionAt: 'issue' ifAbsent: [
		^ self fetchNextIssue ].
	
	issue := self issueChecker issue: issueNumber.