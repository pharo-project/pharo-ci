action-list
listIssues
	
	self optionAt: 'issue' ifPresent: [ :id | ^ self listIssueWithId: id ].
		
	(self hasOption: 'next') ifTrue: [ ^ self listNextIssue ].
		
	^ self listOpenIssues.
	
