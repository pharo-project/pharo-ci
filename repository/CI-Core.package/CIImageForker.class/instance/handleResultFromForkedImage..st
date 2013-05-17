result handling main image
handleResultFromForkedImage: forkedImage
	
	self prepareListenSocket.
	^ self readResultFromForkedImage: forkedImage