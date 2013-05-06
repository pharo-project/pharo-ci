action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	issue := self manager nextIssueToBeChecked.
	issue ifNil: [ 
		self stderr red: 'No more open issues available'; cr.
		self exitSuccess ].
	^ issue