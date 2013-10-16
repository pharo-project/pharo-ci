protocol-query
nextIssueToBeChecked

	^ (self getIssuesForQuery: 'status:"Fix Review Needed" status:open -milestone:Later milestone:"Pharo', SystemVersion current dottedMajorMinor,'" sort:priority'  max: 1)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :issues | issues first ]