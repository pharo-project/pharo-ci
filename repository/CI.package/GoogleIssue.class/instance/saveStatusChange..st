integration-private
saveStatusChange: aMessageString
	
	^ self postXML: (self statusUpdateXML: aMessageString)