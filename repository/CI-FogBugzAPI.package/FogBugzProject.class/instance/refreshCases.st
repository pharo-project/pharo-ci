queries
refreshCases

	cases := nil.
	^ cases := self tracker getIssuesForQuery: ('status:open project:', self title asString)