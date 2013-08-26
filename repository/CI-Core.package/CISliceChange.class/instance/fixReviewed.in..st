updating
fixReviewed: aMessage in: pharoReleaseNumber
	self case 
		statusFixReviewed; 
		saveStatus: aMessage withInternetLineEndings.
	
	self case 
		tags add: 'Validated in ', pharoReleaseNumber asString.
	self case	saveTags