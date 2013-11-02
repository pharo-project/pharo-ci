protocol-query
nextIssueQuery
	^ 'status:"Fix Review Needed" ',
	'status:open ',
	'-milestone:Later ',
	'milestone:"Pharo', SystemVersion current dottedMajorMinor,'" ',
	'-tag:noMonkey ',
	'sort:priority ' 