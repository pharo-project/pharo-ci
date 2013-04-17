action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	issue := self issueChecker nextIssueToBeChecked.
	issue ifNil: [ 
		self stderr red: 'No more open issues available'; cr.
		self exitSuccess ].
	^ issue