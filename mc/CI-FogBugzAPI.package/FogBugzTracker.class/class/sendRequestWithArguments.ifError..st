private
sendRequestWithArguments: arguments ifError: aBlock
 	| client response |
	
	(arguments keys anySatisfy: [ :key | key beginsWith: 'File' ])
		ifTrue: [ ^ self sendFileWithArguments: arguments ifError: aBlock ].
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
				
	arguments keysAndValuesDo: [ :key :value | 
		client formAt: key put: value ].
	
	response := client post.
	client response isError 
		ifTrue: [ aBlock cull: (self extractErrorMessage: client response) ].
	self validateXML: response ifError: aBlock.
	^ response