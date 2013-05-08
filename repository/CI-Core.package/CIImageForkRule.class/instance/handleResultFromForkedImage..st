result handling main image
handleResultFromForkedImage: forkedImage
	
	self prepareListenSocket.
	self addValidationResult: (self readResultFromForkedImage: forkedImage)