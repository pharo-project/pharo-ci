updating
saveTags: aMessage
	self tracker 
		editIssue: self id 
		withArguments: (Dictionary new  
				at: 'sEvent' put: aMessage asString;
				at: 'sTags' put: self tagsString;
				yourself)