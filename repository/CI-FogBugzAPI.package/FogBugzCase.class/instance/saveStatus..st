updating
saveStatus: aMessage
	self tracker 
		editIssue: self id 
		withArguments: (Dictionary new  
				at: 'sEvent' put: aMessage asString;
				at: 'sStatus' put: self status;
				yourself)