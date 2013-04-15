updating
fixReviewed: aMessage in: pharoReleaseNumber
	self case 
		statusFixReviewed; 
		saveStatus: aMessage.
	
	self case 
		tags add: 'Validated in ', pharoReleaseNumber asString;
		saveTags: aMessage