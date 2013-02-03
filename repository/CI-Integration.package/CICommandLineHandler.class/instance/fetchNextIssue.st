action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	issue := tracker nextIssue.
	issue ifNil: [ 
		self stderr red: 'No more open issue available'.
		self exitSuccess ]