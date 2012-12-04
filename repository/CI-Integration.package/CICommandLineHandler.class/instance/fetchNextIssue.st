action
fetchNextIssue

	stderr yellow;
		nextPutAll: 'Fetching next issue...'; 
		flush; clear; lf.
	issue := tracker nextIssue.
	issue ifNil: [ 
		self exitFailure: 'No more open issue available' ]