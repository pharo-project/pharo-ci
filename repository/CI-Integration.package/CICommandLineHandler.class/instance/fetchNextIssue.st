action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	change := self issueChecker nextIssueToBeChecked.
	change ifNil: [ 
		self stderr red: 'No more open issues available'; cr.
		self exitSuccess ].
	^ change