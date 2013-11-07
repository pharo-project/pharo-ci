protocol-query
nextIssueQuery
	^ 'status:"Fix Review"',
	'status:open ',
	'-milestone:Later ',
	'milestone:"Pharo', SystemVersion current dottedMajorMinor,'" ',
	'-tag:noMonkey ',
	'sort:priority ' 