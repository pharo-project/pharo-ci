private
issuesFromXML: xml
	
	^ (((Soup fromString: xml) findAllTags: 'entry' ) collect: [ :node| 
				(GoogleIssue fromXML: node)
					tracker: self;
					yourself ]) asArray.	