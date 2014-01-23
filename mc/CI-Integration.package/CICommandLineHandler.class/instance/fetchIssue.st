action
fetchIssue
	| issueId |
	
	issueId := self optionAt: 'issue' ifAbsent: [ ^ self fetchNextIssue ].

	issueId = 'next'
		ifTrue: [  ^ self fetchNextIssue ].
		
	issue := self manager changeWithId: issueId.