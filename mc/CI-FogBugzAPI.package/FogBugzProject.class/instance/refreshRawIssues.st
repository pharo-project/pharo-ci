accessing
refreshRawIssues
	^ rawIssues := self tracker getRawIssuesForProject: self title asString.