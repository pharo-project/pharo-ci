protocol
getAllReviewNeededIssues
	
	^ self getIssuesForQuery: 'status:ReviewNeeded'