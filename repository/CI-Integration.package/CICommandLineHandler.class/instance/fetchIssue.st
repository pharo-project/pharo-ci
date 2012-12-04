action
fetchIssue
	| issueNumber |
	issueNumber := self optionAt: 'issue' ifAbsent: [
		^ self fetchNextIssue ].
	issue := tracker issue: issueNumber.