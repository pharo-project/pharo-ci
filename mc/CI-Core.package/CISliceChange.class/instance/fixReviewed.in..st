updating
fixReviewed: aMessage in: pharoReleaseNumber
	self case 	statusFixReviewed.
	self case tags add: 'Validated in ', pharoReleaseNumber asString.
	self case	saveStatusAndTags: aMessage withInternetLineEndings.