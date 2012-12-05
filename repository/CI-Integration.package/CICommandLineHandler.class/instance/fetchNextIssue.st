action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	issue := tracker nextIssue.
	issue ifNil: [ 
		self exitFailure: 'No more open issue available' ]