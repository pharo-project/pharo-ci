loading
loadComments
	|contents doc nodes |
	
	contents := (self tracker get: (self url: '/comments/full')) contents.
	
	doc := GoogleIssueTracker soupClass fromString: contents.
	
	^ ((doc findAllTags: 'entry') collect: [ :node| 
		(GoogleIssueComment fromXML: node)
			issue: self;
			yourself ]) asArray.	
	