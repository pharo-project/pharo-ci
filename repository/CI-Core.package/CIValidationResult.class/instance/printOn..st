printing
printOn: aStream
	self 
		printFailuresOn: aStream;
		printWarningsOn: aStream;
		printMessagesOn: aStream