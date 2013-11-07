protocol-query
nextIssueToBeChecked
	
	^ (self getIssuesForQuery: self nextIssueQuery max: 50)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :issues | 
			issues 
				detect: [ :issue | issue sholdBeChecked ] 
				ifNone: [ nil ]]