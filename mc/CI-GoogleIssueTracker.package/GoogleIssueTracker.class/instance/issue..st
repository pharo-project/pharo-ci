issues
issue: id
	
	^ (self issuesWithParams: 'id=', id asString) first.