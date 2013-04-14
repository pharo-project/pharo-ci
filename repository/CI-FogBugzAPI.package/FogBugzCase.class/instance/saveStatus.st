updating
saveStatus
	self tracker 
		editIssue: self id 
		withArguments: (Dictionary new 
				at: 'sStatus' put: self status;
				yourself)