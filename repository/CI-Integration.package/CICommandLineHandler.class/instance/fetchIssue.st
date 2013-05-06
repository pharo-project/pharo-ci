action
fetchIssue

	issue := self manager changeWithId: (self optionAt: 'issue' ifAbsent: [ ^ self fetchNextIssue ]).