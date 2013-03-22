private
sendRequestWithArguments: arguments ifError: aBlock
 	| client response |
	
	(arguments keys anySatisfy: [:key | key beginsWith: 'File' ])
		ifTrue: [ ^ self sendFileWithArguments: arguments ifError: aBlock ].
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
				
	arguments keysAndValuesDo: [ :key :value | 
		client queryAt: key put: value ].
	
	response := client get.
	client response isError ifTrue: aBlock.
	self validateXML: response ifError: aBlock.
	^ response