printing
printErrorsOn: aStream
	self printList: self errors named: 'Failures' on: aStream.