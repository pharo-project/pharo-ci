updating
saveStatusAndTags: aMessage
	self tracker 
		editIssue: self id 
		withArguments: (Dictionary new  
				at: 'sEvent'		put: aMessage asString;
				at: 'sStatus'		put: self status;
				at: 'sTags'		put: self tagsString;
				yourself)