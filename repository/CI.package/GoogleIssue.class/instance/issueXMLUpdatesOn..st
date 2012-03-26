private-XML code
issueXMLUpdatesOn: stream
	
	stream	nextPutAll: '<issues:updates>'.
	self issueXMLStatusOn: stream.
	stream nextPutAll: '</issues:updates>'