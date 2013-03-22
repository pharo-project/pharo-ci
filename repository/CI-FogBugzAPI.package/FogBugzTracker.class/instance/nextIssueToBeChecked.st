protocol-query
nextIssueToBeChecked

	^ (self getIssuesForQuery: 'status:"Fix Review Needed" status:open -milestone:Later -milestone:"Pharo 2.0" sort:priority'  max: 1)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :issues | issues first ]