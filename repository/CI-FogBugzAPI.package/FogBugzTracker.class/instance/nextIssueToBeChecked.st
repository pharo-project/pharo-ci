protocol-query
nextIssueToBeChecked
	
	^ (self getIssuesForQuery: self nextIssueQuery max: 10)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :issues | 
			issues 
				detect: [ :issue | issue canBeChecked ] 
				ifNone: [ nil ]]